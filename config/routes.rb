Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    post "/rate" => "rater#create", :as => "rate"
    root to: "pages#index"
    resources :mobiles
    resources :makers
    resources :carts
    resources :orders
    get "/search" => "mobiles#search"
  end

  devise_for :users, controllers: { omniauth_callbacks: "user/omniauth_callbacks",
                                    registrations: "registrations" }
end
