Rails.application.routes.draw do
  root 'uploads#index'
  resources :uploads, only: %i[index create destroy new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
