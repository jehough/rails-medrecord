Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#home"
  resources :doctors do
    get '/home' => 'doctors#home'
  end

  resources :patients do
    get '/home' => 'patients#home'

  end

  resources :medications
  resources :appointments, only: [:index, :show, :edit, :update, :destroy] do
    get '/add_patient' => 'appointments#add_patient'
    
  end

  resources :doc_scheds, only: [:new, :create]

    get '/appointment/destroy_past' => 'appointments#destroy_past'
    get '/doctor/login' => 'doctor_sessions#new'
    post '/doctor/login' => 'doctor_sessions#create'
    get '/patient/login' => 'patient_sessions#new'
    post '/patient/login' => 'patient_sessions#create'

    get '/doctor/logout' => 'doctor_sessions#destroy'
    get '/patient/logout' => 'patient_sessions#destroy'

    get '/patient_med/delete' => 'patient_meds#destroy'
    get '/admin_tools/tools' => 'admin_tools#tools'

end
