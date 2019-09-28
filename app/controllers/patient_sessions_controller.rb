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
