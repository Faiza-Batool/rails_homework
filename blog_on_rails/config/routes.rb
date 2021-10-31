Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # RESTful routes
  get('/', {to: 'posts#index', as: 'root'})
  # get('/posts/new',{to: 'posts#new'})
  # get('/posts/:id',{to: 'posts#show', as: :post })
  # delete('/posts/:id',{to: 'posts#destroy'})
  # post('/posts/',{to: 'posts#create'})
  # get('/posts/:id/edit',{to: 'posts#edit', as: :edit_post})
  # patch('/posts/:id', {to: 'posts#update'})

  resources :posts do
        resources :comments, only:[:create, :destroy]
  end

  resources :users, only:[:new, :create, :edit, :update] 

  resource :session, only:[:new, :create, :destroy]

  get('users/:id/edit_password',{to: "users#edit_password", as: :edit_password})
  patch('/users/:id/edit_password',{to: 'users#change_password', as: :update_password}) 

end
