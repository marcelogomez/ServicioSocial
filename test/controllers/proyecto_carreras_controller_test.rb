require 'test_helper'

class ProyectoCarrerasControllerTest < ActionController::TestCase
  setup do
    @proyecto_carrera = proyecto_carreras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyecto_carreras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto_carrera" do
    assert_difference('ProyectoCarrera.count') do
      post :create, proyecto_carrera: { carrera_id: @proyecto_carrera.carrera_id, proyecto_id: @proyecto_carrera.proyecto_id }
    end

    assert_redirected_to proyecto_carrera_path(assigns(:proyecto_carrera))
  end

  test "should show proyecto_carrera" do
    get :show, id: @proyecto_carrera
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto_carrera
    assert_response :success
  end

  test "should update proyecto_carrera" do
    patch :update, id: @proyecto_carrera, proyecto_carrera: { carrera_id: @proyecto_carrera.carrera_id, proyecto_id: @proyecto_carrera.proyecto_id }
    assert_redirected_to proyecto_carrera_path(assigns(:proyecto_carrera))
  end

  test "should destroy proyecto_carrera" do
    assert_difference('ProyectoCarrera.count', -1) do
      delete :destroy, id: @proyecto_carrera
    end

    assert_redirected_to proyecto_carreras_path
  end
end
