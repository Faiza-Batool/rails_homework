Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # RESTful routes
  get('/', {to: 'posts#index'})
  # get('/posts/new',{to: 'posts#new'})
  # get('/posts/:id',{to: 'posts#show', as: :post })
  # delete('/posts/:id',{to: 'posts#destroy'})
  # post('/posts/',{to: 'posts#create'})
  # get('/posts/:id/edit',{to: 'posts#edit', as: :edit_post})
  # patch('/posts/:id', {to: 'posts#update'})

  resources :posts do
        resources :comments, only:[:create, :destroy]
  end

end
