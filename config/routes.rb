Rails.application.routes.draw do
  resources :target_groups do
  	collection do
  		get ':country_code', action: :index_by_country_code
  	end
  end
  # resources :location_groups
  resources :locations do
  	collection do
  		get ':country_code', action: :index_by_country_code
  	end
  end
  # resources :countries
  # resources :panel_providers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
