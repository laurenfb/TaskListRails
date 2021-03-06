Rails.application.routes.draw do

  root to: 'homepages#index'

  # this to: is the same as a hash rocket
  get 'auth/:provider/callback', to: 'sessions#create'

  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'tasks/index' => 'tasks#index', as: 'index'

  get 'tasks/show/:id' => 'tasks#show', as: 'show'

  get 'tasks/new' => 'tasks/new', as: 'new'

  post 'tasks/create' => 'tasks#create', as: 'create'

  get 'tasks/:id/edit' => 'tasks#edit', as: 'edit'

  put 'tasks/:id/update' => 'tasks#update', as: 'update'
  # do this later - want to  make it put instead

  delete 'tasks/:id' => 'tasks#destroy', as: 'delete'

end
