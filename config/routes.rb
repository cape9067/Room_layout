Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
   registrations: "public/registrations",
   sessions: 'public/sessions',
 }

 devise_scope :user do
   get '/users/sign_out' => 'public/sessions#destroy'
 end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
   sessions: 'admins/sessions'
 }

 devise_scope :admin do
  get '/admins/sign_out', to: 'admin/sessions#destroy', as: 'admin_log_out'
end

devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

 root :to => "public/homes#top"
 get '/admin' => 'admin/homes#top'

  namespace :public do
    resources :rooms do
     resources :comments, only: [:create, :destroy]
     resource :likes, only: [:create, :destroy]
     
    end
    
    resources :users, only: [:show, :edit, :update] do
     resources :bookmarks, only: [:create, :destroy, :index]
    end
  end

  namespace :admin do
    resources :categories, only: [:index, :edit, :create, :destory, :update]
    
    resources :rooms, only: [:index, :show, :destroy] do
     resources :comments, only: [:create, :destroy]
    end
    
    resources :users, only: [:index, :show, :edit, :update]

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
