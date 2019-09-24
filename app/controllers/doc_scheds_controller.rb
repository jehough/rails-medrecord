class DocSchedsController < ApplicationController

  def new
    @sched = DocSched.new
  end

  def create
    raise params
  end

  private

  def sched_params
    params.require(:doc_sched).permit(:doctor_id, :date, :shift_start, :shift_end)
  end
end
