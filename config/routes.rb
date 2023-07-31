Rails.application.routes.draw do
  root 'conversion_pages#personal'
  get 'emperor', to: 'conversion_pages#emperor'
  get 'to_ad', to: 'conversion_pages#to_ad'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
