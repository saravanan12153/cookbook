Rails.application.routes.draw do

  get 'chefs/new'

  get 'chef/new'

  root 'pages#home'

  resources :recipes do
    member do
      post 'like'
    end
  end

  resources :chefs, except: [:new]

  get '/register', to: 'chefs#new'

end
