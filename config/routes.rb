Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    post "/rate" => "rater#create", :as => "rate"
    devise_for :users
    root to: "home#index"
  end
end
