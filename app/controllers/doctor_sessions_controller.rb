class DoctorSessionsController < ApplicationController

  def new
    @doctor= Doctor.new
  end

  def create
    if @doctor = Doctor.find_by(username: params[:doctor][:username])
      if @doctor.authenticate(params[:doctor][:password])
        session[:doctor_id] = @doctor.id
        redirect_to "/doctors/#{@doctor.id}/home"
      else
        flash[:alert] = "Incorrect Email/Password Combination"
        redirect_to '/'
      end
    else
      flash[:alert] = "Incorrect Email/Password Combination"
      redirect_to '/'
    end
  end

  def destroy
    session.delete :doctor_id
    redirect_to '/'
  end
end
