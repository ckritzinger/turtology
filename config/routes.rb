Rails.application.routes.draw do
  get 'gallery' => 'home#index', as: :landing
  get 'draw' => 'home#draw', as: :draw
  root 'home#draw'
end
