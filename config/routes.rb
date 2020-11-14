Rails.application.routes.draw do
  root :to => "pets#index"
  resources :pets do
    resources :medical_records
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
