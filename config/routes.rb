# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2019-2020
# - Engelberg See

# Code History:
# Engelberg See - 01/20/20 - Generated the routes for the application
# Engelberg See - 01/22/20 - Modified to have a home page for the application instead of the default rails success page
# Engelberg See - 01/29/20 - Added license, code history and Internal Documentation

# File Creation Date: 01/20/20
# Development Group: Engelberg See
# Purpose: Essential for the application to have an index page where all actions can be made


Rails.application.routes.draw do
  resources :preferences
  resources :instructors
  resources :preferredsubjects
  resources :courses
  get 'main/index'
  get 'home/index'
  root 'home#index'
  devise_for :admins
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
