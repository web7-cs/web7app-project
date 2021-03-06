class DivisorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render 'divisor/new'
  end

  def evaluate
    numerator = params[:number_1].to_i
    denominator = params[:number_2].to_i

    begin
      if (denominator == 0)
        log = Logger.new("log/error.log")
        log.level = Logger::INFO


        log.error "About to divide given number by zero"

        log.logger(numerator / denominator)
      end

    rescue ZeroDivisionError => e
      #@message = "Opps ZeroDivisionError Occured. Please check the details for more info"
      @message =File.read('log/error.log')
    else
      @message = 	(numerator / denominator)
    end
    render 'divisor/result'
  end




end
