class ProyectoCarrerasController < ApplicationController
  before_action :set_proyecto_carrera, only: [:show, :edit, :update, :destroy]

  # GET /proyecto_carreras
  # GET /proyecto_carreras.json
  def index
    @proyecto_carreras = ProyectoCarrera.all
  end

  # GET /proyecto_carreras/1
  # GET /proyecto_carreras/1.json
  def show
  end

  # GET /proyecto_carreras/new
  def new
    @proyecto_carrera = ProyectoCarrera.new
  end

  # GET /proyecto_carreras/1/edit
  def edit
  end

  # POST /proyecto_carreras
  # POST /proyecto_carreras.json
  def create
    @proyecto_carrera = ProyectoCarrera.new(proyecto_carrera_params)

    respond_to do |format|
      if @proyecto_carrera.save
        format.html { redirect_to @proyecto_carrera, notice: 'Proyecto carrera was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto_carrera }
      else
        format.html { render :new }
        format.json { render json: @proyecto_carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyecto_carreras/1
  # PATCH/PUT /proyecto_carreras/1.json
  def update
    respond_to do |format|
      if @proyecto_carrera.update(proyecto_carrera_params)
        format.html { redirect_to @proyecto_carrera, notice: 'Proyecto carrera was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto_carrera }
      else
        format.html { render :edit }
        format.json { render json: @proyecto_carrera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_carreras/1
  # DELETE /proyecto_carreras/1.json
  def destroy
    @proyecto_carrera.destroy
    respond_to do |format|
      format.html { redirect_to proyecto_carreras_url, notice: 'Proyecto carrera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto_carrera
      @proyecto_carrera = ProyectoCarrera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_carrera_params
      params.require(:proyecto_carrera).permit(:proyecto_id, :carrera_id)
    end
end
