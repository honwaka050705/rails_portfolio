Rails.application.routes.draw do
  root 'conversion_pages#personal'
  get 'emperor', to: 'conversion_pages#emperor'
  get 'to_ad', to: 'conversion_pages#to_ad'
  get 'to_nippons_year', to: 'conversion_pages#to_nippons_year'
end
