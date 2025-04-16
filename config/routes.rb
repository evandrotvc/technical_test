Rails.application.routes.draw do
  resources :book do
    member do
      post :reserve
    end
  end
end
