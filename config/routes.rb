Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    post "/rate" => "rater#create", :as => "rate"
    root to: "pages#index"
    resources :mobiles
    resources :makers
  end
  
  devise_for :users, controllers: { omniauth_callbacks: "user/omniauth_callbacks" }
end
