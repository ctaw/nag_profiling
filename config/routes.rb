Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
    as :user do
      delete 'logout', :to => 'sessions#destroy'
    end

  root :to => "site/home#index"

  namespace :admin do 
    resources :dashboard
    resources :users
    resources :family_groups
    resources :church_involvements
    resources :members
  end

end