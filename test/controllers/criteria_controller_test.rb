require 'test_helper'

class CriteriaControllerTest < ActionController::TestCase
  setup do
    @criterium = criteria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criteria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterium" do
    assert_difference('Criterium.count') do
      post :create, criterium: { akurasi_tendangan: @criterium.akurasi_tendangan, berat_badan: @criterium.berat_badan, group_id: @criterium.group_id, kecepatan_berlari: @criterium.kecepatan_berlari, member_id: @criterium.member_id, prestasi: @criterium.prestasi, tinggi_badan: @criterium.tinggi_badan }
    end

    assert_redirected_to criterium_path(assigns(:criterium))
  end

  test "should show criterium" do
    get :show, id: @criterium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @criterium
    assert_response :success
  end

  test "should update criterium" do
    patch :update, id: @criterium, criterium: { akurasi_tendangan: @criterium.akurasi_tendangan, berat_badan: @criterium.berat_badan, group_id: @criterium.group_id, kecepatan_berlari: @criterium.kecepatan_berlari, member_id: @criterium.member_id, prestasi: @criterium.prestasi, tinggi_badan: @criterium.tinggi_badan }
    assert_redirected_to criterium_path(assigns(:criterium))
  end

  test "should destroy criterium" do
    assert_difference('Criterium.count', -1) do
      delete :destroy, id: @criterium
    end

    assert_redirected_to criteria_path
  end
end
