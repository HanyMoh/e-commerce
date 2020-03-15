Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :admins
  devise_for :organization_managers
  devise_for :employee_users
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root 'pages#index'
  get 'privacy_policy', to: 'pages#privacy_policy'

  get 'api', to: 'apis#index'
  get '/admins' => redirect('/admins/sign_in')
  get '/manager' => redirect('/organization_managers/sign_in')
  get '/employee' => redirect('/employee_users/sign_in')
  post :developer_check, to: 'apis#check'

  namespace :store do
    get '/:area/:brand/:id', to: 'navboxes#shop'
    get '/:area/:brand/:id/section/:section', to: 'navboxes#section'
    get '/:area/:brand/:shop_id/products/:id/:name', to: 'navboxes#show'
    get '/:area/:brand/:id/results', to: 'navboxes#results'
    post 'add_to_cart/:brand_id/:product_id/:sub_product_id', to: 'navboxes#add_to_cart', as: :add_to_cart
    delete 'remove_from_cart/:cart_entry_id', to: 'navboxes#remove_from_cart', as: :remove_from_cart
    get 'view_cart/:cart_id', to: 'navboxes#view_cart', as: :view_cart
    get 'check_out/:cart_id', to: 'navboxes#checkout_cart', as: :checkout_cart
  end

  namespace :admin do
    get '/', to: 'admins#intro_page'
    get '/dashboard', to: 'admins#dashboard'
    get '/dashboard_beta', to: 'admins#dashboard_beta'
    get '/guides', to: 'admins#guides'
    get '/intro_page', to: 'admins#intro_page'
    get '/intro_form', to: 'admins#intro_form'
    post :change_password, to: 'admins#change_password'
    get :data_entry, to: 'products#data_entry'

    resources :developers
    resources :admins
    resources :organization_managers
    resources :employee_users
    resources :roles
    resources :organizations
    resources :organization_themes
    resources :buildings
    resources :categories
    resources :subscribed_users, only: %i[index show create]
    resources :orders
    resources :meta_tags
    resources :social_links
    resources :google_analytics
    resources :facebook_pixels
    resources :seo_page_titles

    resources :app_tokens do
      member do
        put :toggle_activation
      end
    end

    resources :brands do
      collection do
        get :intro_form
      end
      member do
        get :get_brand_shops
        get :get_brand_sub_categories
      end
    end

    resources :shops do
      collection do
        resources :shop360s do
          resources :shop_floors do
            resources :shop_sections do
              resources :scenes
            end
          end
          resources :sections
          collection do
            get :preview
            post :publish
          end
        end
        get 'shop360ms/:id', to: 'shops#shop360ms', as: :shop360ms
        get 'shop_assets/:id', to: 'shops#shop_assets', as: :shop_assets
        get :manage_360
        post 'remove_from_360_list/:id', to: 'shops#remove_from_360_list', as: :remove_from_360_list
        post :clear_selections
      end
    end

    resources :products do
      collection do
        post :import_products
        post :update_products
        post :update_images
      end

      resources :sub_products do
        resources :stocks
      end
    end
  end

  namespace :shop360_api, path: 'ipa-shop360', defaults: { format: :json } do
    namespace :v1, path: 'ver/sion/one' do
      get 'shop360_images', to: 'shop360s#shop360_images'
      get 'download_sections_images', to: 'shop360s#download_sections_images'
      get 'download_view_image', to: 'shop360s#download_view_image'
      get 'download_json_data', to: 'shop360s#download_json_data'
      get 'download_products_positions', to: 'shop360s#download_products_positions'
      post 'upload_json_data', to: 'shop360s#upload_json_data'
      post 'upload_products_positions', to: 'shop360s#upload_products_positions'
      get 'vr_filtered_products', to: 'shop360s#vr_filtered_products'
      get 'fe_filtered_products', to: 'shop360s#fe_filtered_products'
    end
  end

  namespace :api, path: 'ipa', defaults: { format: :json } do
    namespace :v2, path: 'ver/sion/two' do
      namespace :dev do
        post :generate_sitemap, to: 'developers#generate_sitemap'
        post :generate_parameterized_attributes, to: 'developers#generate_parameterized_attributes'
        post :brand_transfer, to: 'developers#brand_transfer'
      end

      namespace :navbox do
        resources :orders, only: %i[show index]
        resources :sessions
        resources :registrations
        resources :subscribed_users, only: :create
        resources :sub_products

        as :user do
          post 'social-media-registration', to: 'social_media#create'
        end

        resources :organizations, only: :show do
          get :organization_theme
          get :social_links
          member do
            get :features
          end
        end

        resources :categories, only: %i[index show] do
          get :children
        end

        resources :shops, only: %i[index show shop_by_name] do
          collection do
            get '/shop_by_name/:name', to: 'shops#shop_by_name'
          end
        end

        resources :store_carts do
          member do
            put :increment_or_decrement
            put :checkout
            post :create_order
            post :add_to_cart
          end
          collection do
            get :show_cart
          end
        end

        resources :pockets do
          member do
            put :increment_or_decrement
            put :checkout
            post :create_order
            post :add_to_pocket
          end
          collection do
            get :show_pocket
          end
        end

        resources :products do
          collection do
            get :sub_product
          end
        end
      end

      namespace :dev do
        resources :new_accounts do
          collection do
            get :create_accounts
          end
        end
      end

      namespace :dashboard do
        resources :manager_sessions
        resources :admin_sessions
        resources :categories
        resources :beacons
        resources :stocks
        resources :organizations
        resources :campaigns
        resources :building_levels
        resources :brand_themes
        resources :organization_themes
        resources :buildings
        resources :employee_users
        resources :users
        resources :floors
        resources :shops
        resources :registrations
        resources :brands
        resources :app_tokens
        resources :developers
        resources :facebook_pixels
        resources :google_analytics
        resources :meta_tags
        resources :orders
        resources :sections
        resources :seo_page_titles
        resources :shop360s
        resources :social_links
        resources :sub_products
        resources :subscribed_users
        resources :tags
        resources :features

        resources :move_managers do
          collection do
            get :create_managers
          end
        end

        resources :countries do
          resources :cities do
            resources :malls
          end
        end

        resources :products do
          collection do
            post :import_products
            post :import_sub_product_gallery
          end
        end
      end

      namespace :mobile do
        resources :products do
          collection do
            post :products_locations
          end
        end
        resources :sub_products
        resources :sessions

        resources :users do
          collection do
            get :profile
          end
        end
      end

      namespace :cashier do
        resources :brands
        resources :categories
        resources :shops
        resources :orders do
          member do
            put :equipped
          end
        end
        resources :products
        resources :sub_products
        resources :sessions do
          collection do
            get :forget_password
            put :update_password
          end
        end
        resources :accounts
        resources :registrations
        resources :analytics
      end
    end
  end
end
