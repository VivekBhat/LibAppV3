Rails.application.routes.draw do
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
  get 'admin' =>'admin/front#index'
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

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
