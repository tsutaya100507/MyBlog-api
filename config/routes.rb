Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    namespace :v1 do
      get 'blogs/:slug' => "blogs#show"
      resources :blogs, :except => [:show]
      resources :secured
    end
  end
end
