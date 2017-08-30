Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index'

  resources :portfolios, except: [:edit, :new] do
    resources :slides, only: [:new, :create]
    get 'slides/:order'             => 'slides#show',       as: 'show_slide'
    get 'slides/:order/edit'        => 'slides#edit',       as: 'edit_slide'
    patch 'slides/:order'           => 'slides#update',     as: 'update_slide'
    delete 'slides/:order'          => 'slides#destroy',    as: 'destroy_slide'
    post 'slides/:order/next_order' => 'slides#next_order', as: 'next_slide'
    post 'slides/:order/prev_order' => 'slides#prev_order', as: 'prev_slide'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
