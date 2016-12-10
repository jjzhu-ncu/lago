__author__ = 'jjzhu'

from scrapy.spider import Spider
import scrapy
from ..items import AnjukeItem


class AnjukeSpider(Spider):
    name = 'anjuke'
    start_urls = [
        'http://hangzhou.anjuke.com/sale/xihu/p'
    ]
    PAGES = 100
    clomn_dict = {
        '小区': 'estate', '位置': 'location', '年代': 'year', '类型': 'type',
        '房型': 'house_layout', '面积': 'house_area', '朝向': 'direction', '楼层': 'floor',
        '装修程度': 'decorate', '房屋单价': 'unit_price', '参考首付': 'downpayment', '参考月供': 'month_pay'
    }

    def start_requests(self):
        for p in range(1, self.PAGES):
            url = self.start_urls[0]
            yield self.make_requests_from_url(url+str(p))

    def parse(self, response):
        house_list_href = response.xpath("//ul[@id='houselist-mod']//li//div[@class='house-details']//a//@href").extract()
        for href in house_list_href:
            try:
                url = href[0:href.index('?')]
            except ValueError:
                url = href
            yield scrapy.Request(url=url, callback=self.parse_detail)
        # http://nb.anjuke.com/prop/view/A600849984?from=structured_dict&spread=filtersearch_p&position=59&now_time=1481350576'

    @staticmethod
    def replace_n_t(input_str):
        return input_str.replace("\t", "").replace("\n", "").replace(" ", "")

    def parse_detail(self, response):
        item = AnjukeItem()
        house_info = response.xpath("//div[@class='houseInfoBox']")[0]
        try:
            detail = house_info.xpath("div/div/div[contains(@class, 'houseInfo-detail')]")[0]
        except IndexError:
            detail = house_info.xpath("div/div/div[contains(@class, 'houseInfoV2-detail')]")[0]
        details = detail.xpath("div/dl")
        for d in details:
            key = d.xpath("dt/text()").extract()[0]
            key = key[0:len(key)-1]
            if key == '小区':
                value = d.xpath("dd/a/text()")[0].extract()
                pass
            elif key == '位置':
                value = '-'.join(d.xpath("dd//p/a/text()").extract())
                value += '-'+d.xpath("dd//p/text()")[-1].extract()[1:-1].strip()

                pass
            else:
                value = d.xpath("dd/text()").extract()[0]
                value = self.replace_n_t(value)
                pass
            item[self.clomn_dict[key]] = value
            print("%s:\t%s" % (self.clomn_dict[key], value))
        yield item
