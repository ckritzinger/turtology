Rails.application.routes.draw do
  devise_for :users

  get 'gallery' => 'home#index', as: :gallery

  get 'projects' => "projects#index", as: :projects
  get 'new' => "projects#new", as: :new_project
  get 'mashup/:project_id' => "projects#clone", as: :clone_project
  get 'show/:project_id' => "projects#show", as: :project
  get 'edit/:project_id' => "projects#edit", as: :edit_project

  post 'project/:project_id/like' => "projects#like", as: :like_project
  post 'save' => 'projects#save', as: :save

  root 'home#index'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
