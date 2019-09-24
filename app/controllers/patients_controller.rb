class PatientsController < ApplicationController
  before_action :current_patient, only: :home


  def home

  end

  def update
    raise params
  end

  private

  def patient_params
    params.require(:patient).permit(appointment: [:height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up], patient_meds: [:medication_id, :dosage, :instructions])
end
