Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todo_lists
  resources :todo_items do
    member do
      post 'mark_completed'
    end
  end
 
  root 'todo_lists#index'
end
