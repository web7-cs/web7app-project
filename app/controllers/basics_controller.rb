class BasicsController < ApplicationController
  def index
  end

  def ps4
  	 @message =File.read('db/structure.sql')
  end

  def ps5
  	render 'basics/ps5'
  end

  def ps6
  end

  def homepage
  end
end
