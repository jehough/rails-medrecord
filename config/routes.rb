Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#home"
  resources :doctors
  get '/doctor/login' => 'doctor_sessions#new'
  post '/doctor/login' => 'doctor_sessions#create'
  get '/doctor/logout' => 'doctor_sessions#destroy'

end
