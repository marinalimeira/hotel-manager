Rails.application.routes.draw do
    
    get 'welcome/index'
    root 'welcome#index'
    
    resources :rooms
    resources :guests
end
