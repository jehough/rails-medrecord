class PatientMedsController < ApplicationController
  before_action :current_doctor

  def destroy
    @med = PatientMed.find(params[:format])
    @patient = @med.patient
    @med.destroy
    redirect_to patient_path(@patient)
  end
end
