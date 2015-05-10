class DiaHorasController < ApplicationController
  before_action :set_dia_hora, only: [:show, :edit, :update, :destroy]

  # GET /dia_horas
  # GET /dia_horas.json
  def index
    @dia_horas = DiaHora.all
  end

  # GET /dia_horas/1
  # GET /dia_horas/1.json
  def show
  end

  # GET /dia_horas/new
  def new
    @dia_hora = DiaHora.new
    @horario_id = params[:get][:horario_id] if params[:get] and params[:get][:horario_id]
  end

  # GET /dia_horas/1/edit
  def edit
  end

  # POST /dia_horas
  # POST /dia_horas.json
  def create
    @dia_hora = DiaHora.new(dia_hora_params)

    respond_to do |format|
      if @dia_hora.save
        format.html { redirect_to @dia_hora, notice: 'Dia hora was successfully created.' }
        format.json { render :show, status: :created, location: @dia_hora }
      else
        format.html { render :new }
        format.json { render json: @dia_hora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dia_horas/1
  # PATCH/PUT /dia_horas/1.json
  def update
    respond_to do |format|
      if @dia_hora.update(dia_hora_params)
        format.html { redirect_to @dia_hora, notice: 'Dia hora was successfully updated.' }
        format.json { render :show, status: :ok, location: @dia_hora }
      else
        format.html { render :edit }
        format.json { render json: @dia_hora.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dia_horas/1
  # DELETE /dia_horas/1.json
  def destroy
    @dia_hora.destroy
    respond_to do |format|
      format.html { redirect_to dia_horas_url, notice: 'Dia hora was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dia_hora
      @dia_hora = DiaHora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dia_hora_params
      params.require(:dia_hora).permit(:dia, :hora_inicio, :hora_fin, :horario_id)
    end
end
