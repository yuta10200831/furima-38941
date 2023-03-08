Rails.application.routes.draw do
  devise_for :users
  root_to: "items#index"
end
