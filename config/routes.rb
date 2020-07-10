Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/events" => "events#index"
    post "/events" => "events#create"
    get "/events/:id" => "events#show"
    patch "/events/:id" => "events#update"
    delete "/events/:id" => "events#destroy"

    post "/sessions" => "sessions#create"

    post "/users" => "users#create"
    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/tags" => "tags#index"
    get "/tags/:id" => "tags#show"

    post "/event_tags" => "event_tags#create"
    get "/event_tags/:id" => "event_tags#show"
    delete "/event_tags/:id" => "event_tags#destroy"

  end
end
