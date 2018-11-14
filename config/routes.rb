Rails.application.routes.draw do
  root 'stalls#index'

  resources :stalls do
    resources :items
  end

end
