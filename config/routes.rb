Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'url_shortener', to: 'url_shortener#url_shortener'
  get 'get_info', to: 'url_shortener#get_info'
  get '/:short_code', to: 'redirect#redirect'
end
