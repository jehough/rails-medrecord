class MedicationsController < ApplicationController
  before_action :current_doctor
  before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  def index
    @medications = Medication.all
  end

  def new
    @medication = Medication.new
  end


  def create
    @medication = Medication.create(med_params)
    redirect_to medications_path
  end

  def show
    @medication= Medication.find(params[:id])
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def med_params
    params.require(:medication).permit(:name, :treats)
  end
end
