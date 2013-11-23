Movie::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root to: 'rails_admin/main#dashboard' # この一行を追加
  
  namespace :api do
    namespace :v1 do
      resources :titles,    only: [:index, :show, :create, :update, :destroy]
      resources :episodes,  only: [:index, :show, :create, :update, :destroy]
      resources :rankings,    only: [:index, :show, :create, :update, :destroy]
    end
  end
end
