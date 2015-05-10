class ListaEsperaProyectosController < ApplicationController
  before_action :set_lista_espera_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /lista_espera_proyectos
  # GET /lista_espera_proyectos.json
  def index
    @lista_espera_proyectos = ListaEsperaProyecto.all
  end

  # GET /lista_espera_proyectos/1
  # GET /lista_espera_proyectos/1.json
  def show
  end

  # GET /lista_espera_proyectos/new
  def new
    @lista_espera_proyecto = ListaEsperaProyecto.new
  end

  # GET /lista_espera_proyectos/1/edit
  def edit
  end

  # POST /lista_espera_proyectos
  # POST /lista_espera_proyectos.json
  def create
    @lista_espera_proyecto = ListaEsperaProyecto.new(lista_espera_proyecto_params)

    respond_to do |format|
      if @lista_espera_proyecto.save
        format.html { redirect_to @lista_espera_proyecto, notice: 'Lista espera proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @lista_espera_proyecto }
      else
        format.html { render :new }
        format.json { render json: @lista_espera_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista_espera_proyectos/1
  # PATCH/PUT /lista_espera_proyectos/1.json
  def update
    respond_to do |format|
      if @lista_espera_proyecto.update(lista_espera_proyecto_params)
        format.html { redirect_to @lista_espera_proyecto, notice: 'Lista espera proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @lista_espera_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @lista_espera_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_espera_proyectos/1
  # DELETE /lista_espera_proyectos/1.json
  def destroy
    @lista_espera_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to lista_espera_proyectos_url, notice: 'Lista espera proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista_espera_proyecto
      @lista_espera_proyecto = ListaEsperaProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lista_espera_proyecto_params
      params.require(:lista_espera_proyecto).permit(:proyecto_id, :usuario)
    end
end
