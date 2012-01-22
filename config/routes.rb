Books::Application.routes.draw do
  get 'authorize/new' => 'authorize#new'
  get 'authorize/create' => 'authorize#create'
  root :to => 'authorize#index'
end
