class PatientsController < ApplicationController
  before_do :current_patient, only: :home

  def home

  end
end
