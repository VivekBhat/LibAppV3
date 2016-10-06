Rails.application.routes.draw do
  resources :reservation_histroys
  resources :adminpages
  get 'pages/show'

  get 'pages/index'

  resources :searches
  resources :booking_histroys
  resources :rooms
  resources :users
  
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


  root 'home#show'

  get 'logg' =>'logg/front#show'
  get 'login' =>'sessions#new'
  get 'users' => 'home#show'
  get 'home' =>'home#show'
  get 'contact' =>'contact#show'
  get 'logout' =>'sessions#destroy'
  get 'about' =>'about#index'


  post 'login' => 'sessions#create'
  get 'admin' =>'adminpages#index'

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
      get 'deleteBooking'
    end
  end

  resources :adminpages do
    member do
      get 'userBookingHistroy'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
