require 'test_helper'

class PeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pea = peas(:one)
  end

  test "should get index" do
    get peas_url
    assert_response :success
  end

  test "should get new" do
    get new_pea_url
    assert_response :success
  end

  test "should create pea" do
    assert_difference('Pea.count') do
      post peas_url, params: { pea: {  } }
    end

    assert_redirected_to pea_url(Pea.last)
  end

  test "should show pea" do
    get pea_url(@pea)
    assert_response :success
  end

  test "should get edit" do
    get edit_pea_url(@pea)
    assert_response :success
  end

  test "should update pea" do
    patch pea_url(@pea), params: { pea: {  } }
    assert_redirected_to pea_url(@pea)
  end

  test "should destroy pea" do
    assert_difference('Pea.count', -1) do
      delete pea_url(@pea)
    end

    assert_redirected_to peas_url
  end
end
