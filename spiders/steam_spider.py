from SteamOntologia.items import SteamOntologiaItem
import re

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
                    #yield scrapy.Request(more_like_url, callback=self.parse)
                    yield scrapy.Request(url, callback=self.parse)



    def parse_dir_contents(self, response):
        item = SteamOntologiaItem()
        flag = 0
        for res in response.xpath("//link[@rel='canonical']").xpath("@href").extract():
            item['link'] = res
        for res in response.xpath("//div[@class='game_purchase_price price']").xpath("text()").extract():
            item['price'] = res.strip()
        for res in response.xpath("//div[@class='discount_final_price']").xpath("text()").extract():
            item['price_with_discount'] = res.strip()
        for res in response.xpath("//div[@class='discount_original_price']").xpath("text()").extract():
            item['price_without_discount'] = res.strip()
        for res in response.xpath("//div[@class='apphub_AppName']").xpath("text()").extract():
            item['name'] = res
            flag = 1
        if flag:
            yield item