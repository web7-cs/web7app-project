
class ScrapeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    #Fox News
    fox_fetchurl = "https://www.foxnews.com/world"
    fox_page = Nokogiri::HTML(open(fox_fetchurl, proxy: URI.parse('http://192.41.170.23:3128')))
    # fox_page = Nokogiri::HTML(open(fox_fetchurl))
    @fox_title = fox_page.at_css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").text
    fox_content_page =fox_page.at_css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").attr('href')

    if fox_content_page['https://www.foxnews.com']
      fox_content_page = fox_content_page
    else
      fox_content_page = 'https://www.foxnews.com' + '' + fox_content_page
    end
    fox_content_page_url = Nokogiri::HTML(open(fox_content_page, proxy: URI.parse('http://192.41.170.23:3128')))
    # fox_content_page_url = Nokogiri::HTML(open(fox_content_page))
    @fox_content = fox_content_page_url.at_css("#wrapper > div.page-content > div.row.full > main > article > div > div.article-content > div.article-body > p").text
    @fox_imageUrl = fox_page.at_css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.m > a > picture > img").attr('src')
    # @fox_article_link = "https://www.foxnews.com/world" + fox_content_page_url.at_css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").attribute("href")

    bp_index_url = "https://www.bangkokpost.com"
    if Rails.env.production?
      html = open(bp_index_url, proxy: URI.parse("http://192.41.170.23:3128"))
    else
      html = open(bp_index_url)
    end
    bp_html = Nokogiri::HTML(html)
    bp_main = bp_html.at_css("div.home-highlights")
    @bp_title = bp_main.at_css("div.list-detail>h2>a").text
    @bp_imageUrl = bp_main.at_css("figure img").attribute("src")
    @bp_content = bp_main.at_css("div.list-detail>p").text
    # @bp_article_link = "https://www.bangkokpost.com/" + bp_main.at_css("figure>a").attr('href')
  end

end
