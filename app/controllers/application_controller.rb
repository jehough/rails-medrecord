class ApplicationController < ActionController::Base
  helper_method :is_patient?
  helper_method :is_doctor?
  helper_method :set_patient
  helper_method :set_doctor
  helper_method :admin?

  def home

  end

  def logged_in?
    if is_patient?
      redirect_to patient_home_path(current_patient)
    elsif is_doctor?
      redirect_to doctor_home_path(current_doctor)
    end
  end

  def is_user?
    !!session[:patient_id] || !!session[:doctor_id]
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
      @doctor = set_doctor
    else
      redirect_to '/'
    end
  end

  def admin?
    if is_doctor?
      set_doctor
      !!@doctor.admin
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
