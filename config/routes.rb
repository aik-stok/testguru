Rails.application.routes.draw do
  get 'about' => 'static_pages#about'
  get 'about/author' => 'static_pages#author'
end
