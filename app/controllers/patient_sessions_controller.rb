class PatientSessionsController < ApplicationController
  before_action :logged_in?, only: [:new]

  def new
    @patient = Patient.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      if @patient = Patient.find_by(email: auth_hash[:info][:email])
        session[:patient_id] = @patient.id
      else
        @patient = Patient.create(email: auth_hash[:info][:email], password: SecureRandom.hex)
        @patient.first_name = Patient.facebook_first(auth_hash[:info][:name])
        @patient.last_name = Patient.facebook_last(auth_hash[:info][:name])
        @patient.save
      end
      session[:patient_id] = @patient.id
      redirect_to patient_home_path(@patient)
    elsif @patient = Patient.find_by(email: params[:patient][:email])
      if @patient.authenticate(params[:patient][:password])
        session[:patient_id] = @patient.id
        redirect_to patient_home_path(@patient)
      else
        flash[:alert] = "Incorrect Email/Password Combination"
        render :new
      end
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      render :new
    end
  end

  def destroy
    session.delete :patient_id
    redirect_to root_path
  end

end
