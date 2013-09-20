Tutorli::Application.routes.draw do
  get "comments/create"

  get "comments/destroy"

  resources :blogs
  resources :comments

  resources :payments do
    collection do
      get :publisher_payments
    end
  end

  resources :admins do
    member do
      post :pay_publisher
    end
  end

  resources :account

  resources :enrolments
  resources :levels
  resources :categories

  resources :pages do
    collection do
      get :home
      get :about
      get :policy
      get :teach
    end
  end

  resources :exercises
  resources :lessons

  resources :courses do
    resources :lessons
    collection do
      get :my
      get :authenticate_with_vimeo
      get :upload
    end
    member do
      put :publish
      get :show_enrolled
    end
  end

  devise_for :users

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  root :to => 'pages#home'
end
