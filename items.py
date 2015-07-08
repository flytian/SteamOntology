# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class SteamOntologiaItem(scrapy.Item):
    name = scrapy.Field()
    link = scrapy.Field()
    price = scrapy.Field()
    price_with_discount = scrapy.Field()
    price_without_discount = scrapy.Field()
    categories = scrapy.Field()
    pass
