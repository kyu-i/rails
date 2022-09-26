Rails.application.routes.draw do
  devise_for :users
  # root 'pages#index'
  # get 'pages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'plans#index'
  get "plans" => "plans#index"
  get "plans/new" => "plans#new"
  post "plans/create" => "plans#create"
  post "plans/:id/plan_details/new" => "plan_details#new"
  get "plans/:id" => "plans#show"
end