class DoctorSessionsController < ApplicationController

  def new
    @doctor= Doctor.new
  end

  def create
    if @doctor = Doctor.find_by(params[:username]) && @doctor.authenticate(params[:password])
      session[:doctor_id] = @doctor.id
      redirect_to doctors_path(@doctor)
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      redirect_to '/'
    end
  end

  def destroy

  end
end
