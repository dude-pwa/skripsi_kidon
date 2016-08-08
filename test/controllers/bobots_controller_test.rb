require 'test_helper'

class BobotsControllerTest < ActionController::TestCase
  setup do
    @bobot = bobots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bobots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bobot" do
    assert_difference('Bobot.count') do
      post :create, bobot: { w1: @bobot.w1, w2: @bobot.w2, w3: @bobot.w3, w4: @bobot.w4, w5: @bobot.w5 }
    end

    assert_redirected_to bobot_path(assigns(:bobot))
  end

  test "should show bobot" do
    get :show, id: @bobot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bobot
    assert_response :success
  end

  test "should update bobot" do
    patch :update, id: @bobot, bobot: { w1: @bobot.w1, w2: @bobot.w2, w3: @bobot.w3, w4: @bobot.w4, w5: @bobot.w5 }
    assert_redirected_to bobot_path(assigns(:bobot))
  end

  test "should destroy bobot" do
    assert_difference('Bobot.count', -1) do
      delete :destroy, id: @bobot
    end

    assert_redirected_to bobots_path
  end
end
