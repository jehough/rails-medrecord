class Admin::DoctorsController < ApplicationController
  before_action :is_admin?

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doc_params)
    if @doctor.valid?
      @doctor.save
      redirect_to doctors_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end
end
