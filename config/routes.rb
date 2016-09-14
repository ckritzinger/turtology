Rails.application.routes.draw do
  devise_for :users

  get 'gallery' => 'home#index', as: :landing
  get 'draw' => 'home#draw', as: :draw
  post 'save' => 'projects#save', as: :save

  root 'home#draw'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
