class DocSchedsController < ApplicationController
  before_action :is_admin?
  def new
    @sched = DocSched.new
  end

  def create
    @sched = DocSched.new(sched_params)
    if @sched.valid?
      @sched.save
      @sched.make_appointments
      redirect_to doctors_path(params[:doc_sched][:doctor_id])
    else
      render :new
    end
  end

  private

  def sched_params
    params.require(:doc_sched).permit(:doctor_id, :date, :shift_start, :shift_end)
  end
end
