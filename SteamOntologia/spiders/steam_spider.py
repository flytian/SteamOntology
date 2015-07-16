from SteamOntologia.items import SteamOntologiaItem
import re
import lxml.etree
# -*- coding: utf-8 -*-

__author__ = 'Jpereira'

import scrapy


class SteamOntologia(scrapy.Spider):
    name = "steam_ontologia"
    start_urls = ["http://store.steampowered.com/tag/pt/Desporto#p=0&tab=NewReleases",
                  "http://store.steampowered.com/genre/Free%20to%20Play/",
                  "http://store.steampowered.com/genre/Early%20Access/",
                  "http://store.steampowered.com/tag/pt/Aventura/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Casual/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Corridas/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Estrat%C3%A9gia/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Indie/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Multijogador%20em%20Massa/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/RPG/#p=0&tab=NewReleases",
                  "http://store.steampowered.com/tag/pt/Simula%C3%A7%C3%A3o/#p=0&tab=NewReleases"
                  ]
    allowed_domains = ["store.steampowered.com"]
    visited_ids = []


    def parse(self, response):
        for href in response.xpath("//a/@href[contains(.,'http://store.steampowered.com/app/')]"):
            app_url = re.compile("http://store.steampowered.com/app/(\d+)/")
            url = response.urljoin(href.extract())
            if app_url.match(url):
                app_id = app_url.search(url).group(1)
                if app_id not in self.visited_ids:
                    self.visited_ids.append(app_id)
                    more_like_url = 'http://store.steampowered.com/recommended/morelike/app/'+str(app_id)
                    yield scrapy.Request(url, callback=self.parse_dir_contents)
                    yield scrapy.Request(more_like_url, callback=self.parse)
                    yield scrapy.Request(url, callback=self.parse)



    def parse_dir_contents(self, response):
        item = SteamOntologiaItem()
        item['categorias'] = []
        item['classificacoes'] = []
        item['linguas'] = []
        item['produtoras'] = []
        item['editoras'] = []
        avaliacao = ""
        free = 0
        #NOME DO JOGO
        for res in response.xpath("//div[@class='apphub_AppName']").xpath("text()").extract():
            item['nome'] = res
        #CATEGORIAS DO JOGO
        for res in response.xpath("//a[@class='app_tag']").xpath("text()").extract():
            if res == 'Free to Play':
                free=1
            item['categorias'].append(res.strip())
        #LINK PARA STEAM
        for res in response.xpath("//link[@rel='canonical']").xpath("@href").extract():
            item['link'] = res
        if free == 0:
            #PRECO
            for res in response.xpath("//*[@id='game_area_purchase']/div[1]/div/div[2]/div/div[1]").extract():
                preco = re.findall("\d+,?\d+", res)
                if preco:
                    item['preco'] = preco[0]

            #PRECO COM PROMOCAO
            for res in response.xpath("//*[@id='game_area_purchase']/div[1]/div/div[2]/div/div[1]/div[2]/div[2]/text()").extract():
                preco_com_desconto = re.findall("\d+,?\d+", res)
                if preco_com_desconto:
                    item['preco_com_desconto'] = preco_com_desconto[0]
                    item.pop('preco')
            #PRECO SEM PROMOCAO
            for res in response.xpath("//*[@id='game_area_purchase']/div[1]/div/div[2]/div/div[1]/div[2]/div[1]/text()").extract():
                preco_sem_desconto = re.findall("\d+,?\d+", res)
                if preco_sem_desconto:
                    item['preco_sem_desconto'] = preco_sem_desconto[0]
            #PERCENTAGEM DE DESCONTO
            for res in response.xpath("//*[@id='game_area_purchase']/div[1]/div/div[2]/div/div[1]/div[1]/text()").extract():
                desconto = re.findall("\d+", res)
                if desconto:
                    item['desconto'] = desconto[0]

        #PEG, CLASSIFICACOES
        for res in response.xpath("//p[@id='descriptorText']").xpath("text() | br").extract():
            if res!="<br>" and len(res)< 20 and '-'not in res:
                item['classificacoes'].append(res.strip())
        #AVALIACAO METASCORE 0-100
        for res in response.xpath("//*[@id='game_area_metascore']/span[1]/text()").extract():
            item['avaliacao'] = res
        #COMENTARIOS POSITIVOS
        for res in response.xpath("//span[@class='user_reviews_count' and contains(preceding::span[1]/text(),'Negative')]").xpath("text()").extract():
            res = res.replace("(", '')
            res = res.replace(")", '')
            res = res.replace(",", '')
            item['comentarios_negativos'] = res.strip()
        #COMENTARIOS NEGATIVOS
        for res in response.xpath("//span[@class='user_reviews_count' and contains(preceding::span[1]/text(),'Positive')]").xpath("text()").extract():
            res = res.replace("(", '')
            res = res.replace(")", '')
            res = res.replace(",", '')
            item['comentarios_positivos'] = res.strip()
        #EDITORA
        for res in response.xpath("//a[contains(preceding::b[1]/text(),'Publisher:')]").xpath("text()").extract():
            editoras = res.split(",")
            for editora in editoras:
               item['editoras'] = editora.strip()
        #PRODUTORA
        for res in response.xpath("//a[contains(preceding::b[1]/text(),'Developer:')]").xpath("text()").extract():
            produtoras = res.split(",")
            for produtora in produtoras:
               item['produtoras'] = produtora.strip()
        #DATA DE LANCAMENTO
        for res in response.xpath("//*[@id='game_highlights']/div[2]/div/div[4]/span/text()").extract():
            item['data_lancamento'] = res

        #LINGUAS
        for res in response.xpath("//td[@class='ellipsis']").xpath("text()").extract():
            if('#' not in res):
                item['linguas'].append(res.strip())
        if item.get('nome'):
            yield item



