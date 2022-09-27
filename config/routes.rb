Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'plans#index'
  get "plans" => "plans#index"
  get "plans/new" => "plans#new"
  post "plans/create" => "plans#create"
  post "plans/:id/plan_details/new" => "plan_details#new"
  get "plans/:id" => "plans#show"
end