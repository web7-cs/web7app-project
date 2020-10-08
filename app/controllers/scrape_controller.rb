require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController
  
  def index
    page = Nokogiri::HTML(open("https://www.foxnews.com/world"))
    @title = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").text
    content_page = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").attr('href')

    if content_page['https://www.foxnews.com']
      content_page = content_page
    else
      content_page = 'https://www.foxnews.com' + '' + content_page
    end
    content_page_url = Nokogiri::HTML(open(content_page))
    @content = content_page_url.css("#wrapper > div.page-content > div.row.full > main > article > div > div.article-content > div.article-body > p").text
    @imageUrl = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.m > a > picture > img").attr('src')
  end

end
