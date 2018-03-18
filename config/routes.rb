Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    mount RailsAdmin::Engine => "/admin", as: "rails_admin"
    post "/rate" => "rater#create", :as => "rate"
    root to: "pages#index"
    resources :mobiles
    resources :comments, only: [:create, :destroy]
    resources :makers
    resources :carts, except: [:show, :new, :edit]
    resources :orders, only: [:new, :create]
    get "/search" => "mobiles#search"
    post "/comment_children" => "comment_childrens#create"
  end

  devise_for :users, controllers: { omniauth_callbacks: "user/omniauth_callbacks",
                                    registrations: "registrations" }
end
