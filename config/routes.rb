Rails.application.routes.draw do
  root 'stalls#index'

  resources :stalls do
    resources :items
  end
  resources :items do
    resources :comments
  end

end
