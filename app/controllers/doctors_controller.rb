class DoctorsController < ApplicationController
  before_action :current_patient, only: [:index, :show]
  before_action :current_doctor, only: [:home]


  def home

  end

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end



end
