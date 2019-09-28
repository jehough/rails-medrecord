class PatientSessionsController < ApplicationController
  before_action :logged_in?, only: [:new]

  def new
    @patient = Patient.new
  end

  def create
    if @patient = Patient.find_by(email: params[:patient][:email])
      if @patient.authenticate(params[:patient][:password])
        session[:patient_id] = @patient.id
        redirect_to patient_home_path(@patient)
      else
        flash[:alert] = "Incorrect Email/Password Combination"
        render :new
      end
    elsif @patient = Patient.find_or_create_by(email: auth[:info][:email])
      @patient.first_name = auth[:info][:first_name]
      @patient.last_name = auth[:info][:last_name]
      @patient.birthday = auth[:info][:user_birthday]
      @patient.save
      session[:patient_id] = @patient.id
      redirect_to patient_home_path(@patient)
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      render :new
    end
  end

  def destroy
    session.delete :patient_id
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end
