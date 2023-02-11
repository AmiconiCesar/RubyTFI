class TurnsController < ApplicationController
  before_action :set_turn, only: %i[ show edit attend update destroy ]

  # GET /turns or /turns.json
  def index
    if Current&.user.Personal?
        @turns = Turn.where(bank_branch_id: Current.user.bank_branch_id).order(:date)
    elsif
      if Current&.user.Cliente?
        @turns = Turn.where(user_id: Current.user.id).order(:date)
      end 
    else 
        @turns = Turn.order(:date)
    end   
  end

  # GET /turns/1 or /turns/1.json
  def show
  end

  # GET /turns/new
  def new
    @turn = Turn.new
  end

  # GET /turns/1/edit
  def edit
  end

  # GET /turns/1/attend
  def attend
  end


  # POST /turns or /turns.json
  def create
    @turn = Turn.new(turn_params)
    @turn.user_id = Current.user.id

    respond_to do |format|
      if @turn.save
        format.html { redirect_to turn_url(@turn), notice: "El turno se creó correctamente ✅" }
        format.json { render :show, status: :created, location: @turn }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turns/1 or /turns/1.json
  def update
      if Current.user.Personal?
         @turn.employee_id = Current.user.id
         @turn.state = :Atendido
      end  
      if @turn.update(turn_params)
          if Current.user.Personal?
             redirect_to turn_url(@turn), notice: "Turno atendido correctamente ✅"    
          else
             redirect_to turn_url(@turn), notice: "Turno actualizado correctamente ✅"
          end
      else
          if Current.user.Personal?
            render :attend, status: :unprocessable_entity
          else
            render :edit, status: :unprocessable_entity
          end  
      end
  end
  
  # DELETE /turns/1 or /turns/1.json
  def destroy
    @turn.destroy

    respond_to do |format|
      format.html { redirect_to turns_url, notice: "Turn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn
      @turn = Turn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_params
      params.require(:turn).permit(:date, :time, :reason, :state, :comment, :bank_branch_id, 
                             :employee_id, :user_id)
    end
end
