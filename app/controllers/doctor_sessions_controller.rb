class DoctorSessionsController < ApplicationController
  before_action :logged_in?, only: [:new]
  def new
    @doctor= Doctor.new
  end

  def create
    if @doctor = Doctor.find_by(username: params[:doctor][:username])
      if @doctor.authenticate(params[:doctor][:password])
        session[:doctor_id] = @doctor.id
        redirect_to doctor_home_path(@doctor)
      else
        flash[:alert] = "Incorrect Email/Password Combination"
        render :new
      end
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      render :new
    end
  end

  def destroy
    session.delete :doctor_id
    redirect_to '/'
  end
end
