class MedicationsController < ApplicationController
  before_action :current_doctor
  before_action :is_admin?, only: [:new, :edit, :create, :update, :destroy]
  def index

  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(med_params)

  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
