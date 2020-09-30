class WebscapperController < ApplicationController
    def index
        #retrive Fox news
        fn_index_url = "https://www.foxnews.com"
        html = open(fn_index_url)
    end    
end
