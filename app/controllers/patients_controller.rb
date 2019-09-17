class PatientsController < ApplicationController
  before_action :current_patient, only: :home


  def home

  end

end
