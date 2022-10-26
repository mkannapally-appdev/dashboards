class DashboardController < ApplicationController

  def home_dashboard
    render({:template => "db_templates/dashboard.html.erb"})
  end

  def forex_dashboard
    raw_data = open("https://api.exchangerate.host/symbols").read
    
    @parsed_data = JSON.parse(raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @symbols_keys_array = @symbols_hash.keys

    render({:template => "db_templates/forex_dashboard.html.erb"})
  end

  def second_currency

    raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @first_currency = params.fetch("from_currency")
    @second_currency_array = @symbols_hash.keys

    render({:template => "db_templates/second_currency.html.erb"})

  end
  

  def currency_conversion
    @first_currency = params.fetch("from_currency")
    @second_currency = params.fetch("second_currency")

    raw_data = open("https://api.exchangerate.host/convert?from=#{@first_currency}&to=#{@second_currency}").read

    @parsed_data = JSON.parse(raw_data)
    @conversion_rate = @parsed_data.fetch("info").fetch("rate")

    render({:template => "db_templates/currency_conversion.html.erb"})
  end
end
