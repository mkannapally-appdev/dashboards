class DashboardController < ApplicationController

  def home_dashboard
    render({:template => "db_templates/dashboard.html.erb"})
  end

  def forex_dashboard
    raw_data = open("https://api.exchangerate.host/symbols").read
    @array_of_symbols = Array.new
    
    @parsed_data = JSON.parse(raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")
    @symbols_keys_array = @symbols_hash.keys

    render({:template => "db_templates/forex_dashboard.html.erb"})
  end
  
end
