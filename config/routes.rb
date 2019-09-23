Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#home"
  resources :doctors do
    get '/home' => 'doctors#home'
  end

  resources :patients do
    get '/home' => 'patients#home'
    resources :medications
  end

  resources :appointments do
    get '/add_patient' => 'appointments#add_patient'
  end

  namespace :admin do
    resources :patients
    resources :doctors
  end
    get '/doctor/login' => 'doctor_sessions#new'
    post '/doctor/login' => 'doctor_sessions#create'
    get '/patient/login' => 'patient_sessions#new'
    post '/patient/login' => 'patient_sessions#create'

    get '/doctor/logout' => 'doctor_sessions#destroy'
    get '/patient/logout' => 'patient_sessions#destroy'


end
