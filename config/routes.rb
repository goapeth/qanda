Rails.application.routes.draw do
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/new'
  # get 'questions/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "questions#index"
  resources :questions
end
