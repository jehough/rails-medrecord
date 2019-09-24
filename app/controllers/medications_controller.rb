class MedicationsController < ApplicationController
  before_action :current_doctor
  before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  def index
    if params[:search]
      @medications = Medication.where('treats LIKE ?', "%#{params[:search]}%")
    else
      @medications = Medication.all
    end
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
    @medication = Medication.find(params[:id])
    @medication.update(med_params)
    redirect_to medications_path
  end

  def destroy
    @medication = Medication.find(params[:id])
    @medication.destroy
    redirect_to medications_path
  end

  private
  def med_params
    params.require(:medication).permit(:name, :treats, :search)
  end
end
