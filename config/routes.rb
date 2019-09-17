Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#home"
  resources :doctors
  get "doctor/login" => 'doctor_sessions#new'
  post 'doctor/login' => 'doctor_sessions#create'
  get 'doctor/logout' => 'doctor_sessions#destroy'


  get '/patient/login' => 'patient_sessions#new'
  post '/patient/login' => 'patient_sessions#create'
  get '/patient/logout' => 'patient_sessions#destroy'
  get '/doctors/:id/home' => 'doctors#home'
end
