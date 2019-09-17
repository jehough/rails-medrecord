class PatientSessionsController < ApplicationController

  def new
  end

  def create
    if @patient = Patient.find_by(params[:email]) && @patient.authenticate(params[:password])
      session[:patient_id] = @patient.id
      redirect_to patient_path(@patient)
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      redirect_to '/'
    end



  end

  def destroy

  end
end
