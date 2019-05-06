# frozen_string_literal: true
Rails.application.routes.draw do
 
 	# Administration
 	# @implemented
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Application
  # @implemented
  root to: 'home#index'
  resources :newsletters, only: [:create, :destroy]
  resources :contacts, only: [:create]
end
