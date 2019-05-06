# frozen_string_literal: true
Rails.application.routes.draw do
 
 # Authentication
 # @implemented
 # devise_for :users

 	# Administration
 	# @implemented
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Application
  # @implemented
  root to: 'home#index'
  resources :newsletters, only: [:create, :destroy]
  resources :contacts, only: [:create]

  # API
  # @implemented
  namespace :api, constraint: { subdomain: 'api'}, path: '/' do
  	namespace :v1 do
  		resources :newsletters
  	end
  	namespace :v2 do
  		# some xml here
  	end
  end
end
