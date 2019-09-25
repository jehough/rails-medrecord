class DoctorsController < ApplicationController
  before_action :current_patient, only: [:index, :show]
  before_action :current_doctor, only: [:home]


  def home

  end

  def index
    if is_patient?
      current_patient
      @doctors = Doctor.all
    elsif is_admin?
      @doctors = Doctor.all
      render :admin_index
    end
  end

  def show
    @doctor = Doctor.find(params[:id])
  end



end
