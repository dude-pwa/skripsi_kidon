require 'test_helper'

class RekapDataControllerTest < ActionController::TestCase
  setup do
    @rekap_datum = rekap_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rekap_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rekap_datum" do
    assert_difference('RekapDatum.count') do
      post :create, rekap_datum: { alamat: @rekap_datum.alamat, handphone: @rekap_datum.handphone, nama: @rekap_datum.nama, nilai: @rekap_datum.nilai, posisi: @rekap_datum.posisi, ranking: @rekap_datum.ranking, tanggal_lahir: @rekap_datum.tanggal_lahir }
    end

    assert_redirected_to rekap_datum_path(assigns(:rekap_datum))
  end

  test "should show rekap_datum" do
    get :show, id: @rekap_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rekap_datum
    assert_response :success
  end

  test "should update rekap_datum" do
    patch :update, id: @rekap_datum, rekap_datum: { alamat: @rekap_datum.alamat, handphone: @rekap_datum.handphone, nama: @rekap_datum.nama, nilai: @rekap_datum.nilai, posisi: @rekap_datum.posisi, ranking: @rekap_datum.ranking, tanggal_lahir: @rekap_datum.tanggal_lahir }
    assert_redirected_to rekap_datum_path(assigns(:rekap_datum))
  end

  test "should destroy rekap_datum" do
    assert_difference('RekapDatum.count', -1) do
      delete :destroy, id: @rekap_datum
    end

    assert_redirected_to rekap_data_path
  end
end
