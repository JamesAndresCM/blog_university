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
    member do
      get :show_posts
    end
    collection do
      get :search_data
    end
    resources :majors
  end
  namespace :users do
    resources :posts do
      member do
          get :post_status
        end
      end
  end

  get 'author/:id', to: 'home#show_author', as: 'author'
  get 'search', to: 'home#search_post_university', as: 'search_university'

  authenticated :user do
    get 'author_profile/:id', to: 'home#author_profile', as: 'author_profile'
    resources :courses
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    mount Ckeditor::Engine => '/ckeditor'
    get '*path' => redirect('/')
  end

  root to: 'home#index'
  get '*path' => redirect('/404')
end
