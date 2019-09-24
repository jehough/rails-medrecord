class MedicationsController < ApplicationController
  before_action :current_doctor
  before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  def index
    if params[:treats]
      raise params
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
  end

  def destroy
  end

  private
  def med_params
    params.require(:medication).permit(:name, :treats, :search)
  end
end
