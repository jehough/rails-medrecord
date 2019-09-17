class PatientSessionsController < ApplicationController

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
        redirect_to '/'
      end
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      redirect_to '/'
    end
  end

  def destroy
    session.delete :patient_id
    redirect_to root_path
  end
end
