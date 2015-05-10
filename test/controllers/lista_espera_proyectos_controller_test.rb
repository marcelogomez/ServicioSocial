require 'test_helper'

class ListaEsperaProyectosControllerTest < ActionController::TestCase
  setup do
    @lista_espera_proyecto = lista_espera_proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lista_espera_proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lista_espera_proyecto" do
    assert_difference('ListaEsperaProyecto.count') do
      post :create, lista_espera_proyecto: { proyecto_id: @lista_espera_proyecto.proyecto_id, usuario: @lista_espera_proyecto.usuario }
    end

    assert_redirected_to lista_espera_proyecto_path(assigns(:lista_espera_proyecto))
  end

  test "should show lista_espera_proyecto" do
    get :show, id: @lista_espera_proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lista_espera_proyecto
    assert_response :success
  end

  test "should update lista_espera_proyecto" do
    patch :update, id: @lista_espera_proyecto, lista_espera_proyecto: { proyecto_id: @lista_espera_proyecto.proyecto_id, usuario: @lista_espera_proyecto.usuario }
    assert_redirected_to lista_espera_proyecto_path(assigns(:lista_espera_proyecto))
  end

  test "should destroy lista_espera_proyecto" do
    assert_difference('ListaEsperaProyecto.count', -1) do
      delete :destroy, id: @lista_espera_proyecto
    end

    assert_redirected_to lista_espera_proyectos_path
  end
end
