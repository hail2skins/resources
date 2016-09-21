require 'api_version'

Rails.application.routes.draw do

  scope defaults: { format: 'json' } do
    namespace :api do
      scope module: :v1, constraints: ApiVersion.new('v1', true) do
        resources :systems
      end
    end
  end
 
  resources :systems
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
