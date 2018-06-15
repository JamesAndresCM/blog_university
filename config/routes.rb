Rails.application.routes.draw do

  devise_scope :user do
    devise_for :users,
               path: '', path_names: {edit: 'edit_profile',
                                      sign_in: 'sign_in',
                                      sign_out: 'logout',
                                      sign_up: 'sign_up'
        }
  end


  resources :universities do
    resources :majors
  end
  namespace :users do
    resources :posts do
      member do
          get :post_status
        end
      end
  end

  get 'author/:id' => 'home#show_author', as: :author

  authenticated :user do
    resources :courses
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Ckeditor::Engine => '/ckeditor'
    get '*path' => redirect('/')
  end

  root to: 'home#index'
  get '*path' => redirect('/404')
end
