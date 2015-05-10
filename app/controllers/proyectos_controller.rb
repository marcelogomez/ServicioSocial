class ProyectosController < ApplicationController
  before_action :set_is_admin
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]


  def set_is_admin
    @is_admin = session[:admin] != nil
  end

  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        params[:proyecto][:carreras].each do |carrera|
          carrera = carrera.to_i
          if carrera > 0 # For some reason the first element in our array is an empty string, so we need to check for valid ids
            asignacion = ProyectoCarrera.new
            asignacion.proyecto = @proyecto
            asignacion.carrera  = Carrera.find(carrera)

            asignacion.save
          end
        end

        format.html { redirect_to @proyecto, notice: 'El proyecto se registró exitosamente' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Se borró el proyecto exitosamente' }
      format.json { head :no_content }
    end
  end

  def projects_for_user
    usuario = Usuario.find params[:get][:usuario_id]
    @asignaciones = ListaEsperaProyecto.where(:usuario_id => usuario.id)
    render file: 'proyectos/projects_for_user'
  end

  def add_user_to_wait_list
    assignment = ListaEsperaProyecto.new
    assignment.usuario_id = params[:post][:usuario_id]
    assignment.horario_id = params[:post][:horario_id]
    assignment.aprobada   = false

    horas_registradas = 0
    assignment.usuario.horarios.each { |horario| horas_registradas += horario.proyecto.horas }

    # Dejar la lista de espera abierta aunque el proyecto este lleno
    # Ver la lista de espera por Orden de llegada
    # Permitir suscribirse a cambio de status de proyectos
    now = Time.now
    if now < assignment.horario.proyecto.registro_inicio
      redirect_to :back, notice:  'El horario de de registro aún no ha empezado.'
    elsif now > assignment.horario.proyecto.registro_fin
      redirect_to :back, notice:  'El registro para este para este proyecto ha finalizado.'
    elsif horas_registradas >= 240
      redirect_to :back, notice: 'Alcanzaste el límite de horas registradas'
    elsif ListaEsperaProyecto.where(:horario_id => assignment.horario.id, :aprobada => false).size >= (2 * assignment.horario.capacidad) # Wait list is twice the number of available spots
      redirect_to :back, notice: 'La lista de espera está llena'
    # elsif ListaEsperaProyecto.where(:horario_id => assignment.horario.id, :aprobada => true).size >= assignment.horario.capacidad
    #   redirect_to :back, notice: 'Ya no hay cupos en el proyecto'
    elsif assignment.save
      redirect_to :back, notice: 'Se añadió a la lista de espera exitosamente'
    else
      redirect_to :back, notice: 'Hubo un error al añadir a la lista de espera'
    end
  end

  def approve_asignacion
    assignment = ListaEsperaProyecto.find params[:post][:asignacion_id]
    assignment.aprobada = true

    horas_registradas = 0
    assignment.usuario.horarios.each { |horario| horas_registradas += horario.proyecto.horas }

    if horas_registradas >= 240
      redirect_to :back, notice: 'El usuario alcanzó el límite de horas inscritas'
    elsif ListaEsperaProyecto.where(:horario_id => assignment.horario.id, :aprobada => true).size >= assignment.horario.capacidad
      redirect_to :back, notice: 'Ya no hay cupos en el proyecto'
    elsif assignment.save
      redirect_to :back, notice: 'Se aprobó la asignación exitosamente'
    else
      redirect_to :back, notice: 'Hubo un error al añadir a la lista de espera'
    end
  end

  def remove_user_from_wait_list
    assignment = ListaEsperaProyecto.where(:usuario_id => params[:post][:usuario_id], :horario_id => params[:post][:horario_id]).first
    assignment.aprobada = false
    if assignment.save
      redirect_to :back, notice: 'Se quitó del proyecto exitosamente'
    else
      redirect_to :back, notice: 'Hubo un error al quitarte de la lista de espera'
    end
  end

  def get_lista_espera_for_proyecto
    @proyecto = Proyecto.find params[:post][:proyecto_id]
    render file: 'proyectos/lista_espera'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      begin
        @proyecto = Proyecto.find(params[:id])
      rescue
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(:nombre, :descripcion, :registro_inicio, :registro_fin, :ubicacion_id, :admin_id, :horas, :requisitos, :carreras, :semestre_minimo, :semestre_max)
    end
end
