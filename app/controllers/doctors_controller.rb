class DoctorsController < ApplicationController
  before_action :current_patient, only: [ :show]
  before_action :is_admin?, only: [:new, :create, :destroy]
  before_action :current_doctor, only: [:home]

  def home

  end

  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    is_admin?
    @doctor = Doctor.new
  end

  def create
    is_admin?
    @doctor = Doctor.new(doc_params)
    if @doctor.valid?
      @doctor.save
      redirect_to doctors_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end

end
