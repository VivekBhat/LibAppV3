Rails.application.routes.draw do
<<<<<<< HEAD
  resources :reservation_histroys
=======
  resources :adminpages
>>>>>>> 378f9895d1468d5016cb1ededd02a305178b951c
  get 'pages/show'

  get 'pages/index'

  resources :searches
  resources :booking_histroys
  resources :rooms
  
  get 'contact/index'

  get 'contact/show'

  namespace :logg do
    get 'front/index'
  end

  namespace :logg do
    get 'front/show'
  end

  get 'about/show'

  get 'about/index'

  get 'home/show'

  get 'home/index'

  namespace :admin do
    get 'front/index'
  end

  namespace :admin do
    get 'front/show'
  end

  namespace :user do
    get 'front/index'
  end

  namespace :user do
    get 'front/show'
  end

  root 'home#show'

  get 'logg' =>'logg/front#show'
  get 'login' =>'sessions#new'
  get 'user' => 'home#show'
  get 'home' =>'home#show'
  get 'contact' =>'contact#show'
  get 'logout' =>'sessions#destroy'
  get 'about' =>'about#index'

  post 'login' => 'sessions#create'
  get 'admin' =>'admin/front#show'

  resources :rooms do
    member do
      get 'book'
      get 'schedule'
    end
  end

  resources :booking_histroys do
    member do
      post 'validBooking'
      get 'releaseBooking'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
