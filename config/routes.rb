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

    resources :members do
      collection do
        get 'church_involvement'
        put :church
      end
    end
    resources :involvements
    # CRUD
    resources :departments
    resources :work_commitments
    resources :positions
    resources :ministries

  end

end