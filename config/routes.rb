Rails.application.routes.draw do
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

  get 'admin' =>'admin/front#index'
  get 'logg' =>'logg/front#show'
  get 'login' =>'sessions#new'
  get 'user' => 'home#show'
  get 'home' =>'home#show'
  get 'contact' =>'contact#show'
  get 'logout' =>'sessions#destroy'
  get 'about' =>'about#index'

  post 'login' => 'sessions#create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
