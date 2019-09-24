class ApplicationController < ActionController::Base
  helper_method :is_patient?
  helper_method :is_doctor?
  helper_method :set_patient
  helper_method :set_doctor

  def home

  end

  def is_patient?
    !!session[:patient_id]
  end

  def is_doctor?
    !!session[:doctor_id]
  end

  def set_patient
    @patient = Patient.find(session[:patient_id])
  end

  def set_doctor
    @doctor = Doctor.find(session[:doctor_id])
  end

  def current_patient
    if is_patient?
      @patient = set_patient
    else
      redirect_to '/'
    end
  end

  def current_doctor
    if is_doctor?
      @patient = set_doctor
    else
      redirect_to '/'
    end
  end

  def is_admin?
    current_doctor
    if @doctor.admin
      @admin = @doctor
    else
      redirect_to '/'
    end
  end
end
