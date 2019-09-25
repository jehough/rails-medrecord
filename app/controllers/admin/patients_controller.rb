class Admin::PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = Appointment.future.available
  end

  def new
    @patient = Patient.new
  end

  def create
    
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update

  end

  def destroy

  end
end
