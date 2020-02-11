Rails.application.routes.draw do
  namespace :ams do
    resources :authors, only: %i[index create update destroy show]
    resources :books, only: %i[index create update destroy show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
