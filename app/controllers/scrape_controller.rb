<<<<<<< HEAD
class ScrapeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
=======
require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController
  
>>>>>>> f1cc30f80dca25de72d34ea44514726e49e720eb
  def index
    fetchurl = "https://www.foxnews.com/world"
    page = Nokogiri::HTML(open(fetchurl, proxy: URI.parse('http://192.41.170.23:3128')))
    @title = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").text
    content_page = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.info > header > h2 > a").attr('href')

    if content_page['https://www.foxnews.com']
      content_page = content_page
    else
      content_page = 'https://www.foxnews.com' + '' + content_page
    end
    content_page_url = Nokogiri::HTML(open(content_page, proxy: URI.parse('http://192.41.170.23:3128')))
    @content = content_page_url.css("#wrapper > div.page-content > div.row.full > main > article > div > div.article-content > div.article-body > p").text
    @imageUrl = page.css("#wrapper > div.page > div.page-content > div > main > div:nth-child(1) > div > article > div.m > a > picture > img").attr('src')
  end

end
