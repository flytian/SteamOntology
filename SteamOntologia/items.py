# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class SteamOntologiaItem(scrapy.Item):
    nome = scrapy.Field()
    link = scrapy.Field()

    preco = scrapy.Field()
    preco_com_desconto = scrapy.Field()
    preco_sem_desconto = scrapy.Field()
    desconto = scrapy.Field()

    categorias = scrapy.Field()

    classificacoes = scrapy.Field()

    avaliacao = scrapy.Field()

    comentarios_positivos = scrapy.Field()
    comentarios_negativos = scrapy.Field()

    linguas = scrapy.Field()

    editoras = scrapy.Field()

    produtoras = scrapy.Field()

    data_lancamento = scrapy.Field()

    pass
