require 'pry'
class PatientsController < ApplicationController
  before_action :current_patient, only: :home


  def home

  end

  def show
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    redirect_to doctor_home_path(current_doctor)
  end

  private

  def patient_params
    params.require(:patient).permit(appointments_attributes: [:id, :height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up], patient_meds_attributes: [:medication_id, :dosage, :instructions])
  end

end
