class ApplicationController < ActionController::Base

  def home

  end

  def is_patient?
    !!session[:patient_id]
  end

  def is_doctor?
    !!session[:doctor_id]
  end

  def current_patient
    if is_patient?
      @patient = Patient.find(session[:patient_id])
    else
      redirect_to root
    end
  end

  def current_doctor
    if is_doctor?
      @doctor = Doctor.find(session[:doctor_id])
    else
      redirect_to root
    end
  end
end
