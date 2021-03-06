Ttv4::Application.routes.draw do
  
  resources :corpus_leads


  resources :anews


  authenticated :user do
    root :to => 'terms#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :corpus_anews
  resources :filters
  resources :users
  resources :terms do
    member do
      get 'dashboard'
      get 'showgender'
      get 'showdatetime'
      get 'showlocation'
      get 'showlist'
      get 'showlead'
      get 'showuserlist'
    end
  end
end
