class DocSchedsController < ApplicationController

  def new
    @sched = DocSched.new
  end

  def create
    @sched = DocSched.new(sched_params)
    if @sched.valid?
      @sched.save
      redirect_to doctor_path(current_doctor)
    else
      flash[:alert] = "Schedule is not valid"
      redirect_to new_doc_sched_path
    end
  end

  private

  def sched_params
    params.require(:doc_sched).permit(:doctor_id, :date, :shift_start, :shift_end)
  end
end
