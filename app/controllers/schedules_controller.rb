class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_bank_branch

  # GET /schedules or /schedules.json
  def index
    @schedules = @bank_branch.schedules.order(:weekday)
  end

  # GET /schedules/1 or /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = @bank_branch.schedules.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to bank_branch_schedule_url(@bank_branch, @schedule), notice: "Horario de atención agregado exitosamente ✅" }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to bank_branch_schedule_url(@bank_branch, @schedule), notice: "Horario de atención actualizado exitosamente ✅" }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to bank_branch_schedules_url, notice: "Horario de atención eliminado exitosamente ✅" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def set_bank_branch
      @bank_branch = BankBranch.find(params[:bank_branch_id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:weekday, :start_time, :end_time)
    end
end
