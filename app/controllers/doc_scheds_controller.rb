class DocSchedsController < ApplicationController

  def new
    raise params
    @sched = DocSched.new
    @doctor = Doctor.find(params[:doctor_id])
  end
end
