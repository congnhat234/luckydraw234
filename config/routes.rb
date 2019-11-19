Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "draw_items#index"
  resources :draw_items
  resources :draw_lists
end
