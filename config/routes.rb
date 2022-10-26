Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {:controller => "dashboard" , :action => "home_dashboard"})
  get("/forex", {:controller => "dashboard" , :action => "forex_dashboard"})
  get("/forex/:from_currency", {:controller => "dashboard" , :action => "second_currency"})
  get("/forex/:from_currency/:second_currency" , {:controller => "dashboard" , :action => "currency_conversion"})

end
