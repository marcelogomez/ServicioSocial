require 'test_helper'

class DiaHorasControllerTest < ActionController::TestCase
  setup do
    @dia_hora = dia_horas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dia_horas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dia_hora" do
    assert_difference('DiaHora.count') do
      post :create, dia_hora: { dia: @dia_hora.dia, hora_fin: @dia_hora.hora_fin, hora_inicio: @dia_hora.hora_inicio }
    end

    assert_redirected_to dia_hora_path(assigns(:dia_hora))
  end

  test "should show dia_hora" do
    get :show, id: @dia_hora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dia_hora
    assert_response :success
  end

  test "should update dia_hora" do
    patch :update, id: @dia_hora, dia_hora: { dia: @dia_hora.dia, hora_fin: @dia_hora.hora_fin, hora_inicio: @dia_hora.hora_inicio }
    assert_redirected_to dia_hora_path(assigns(:dia_hora))
  end

  test "should destroy dia_hora" do
    assert_difference('DiaHora.count', -1) do
      delete :destroy, id: @dia_hora
    end

    assert_redirected_to dia_horas_path
  end
end
