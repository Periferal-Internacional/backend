require "test_helper"

class DocumentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documentation = documentations(:one)
  end

  test "should get index" do
    get documentations_url, as: :json
    assert_response :success
  end

  test "should create documentation" do
    assert_difference("Documentation.count") do
      post documentations_url, params: { documentation: { name: @documentation.name, type: @documentation.type, uploaded_by_id: @documentation.uploaded_by_id } }, as: :json
    end

    assert_response :created
  end

  test "should show documentation" do
    get documentation_url(@documentation), as: :json
    assert_response :success
  end

  test "should update documentation" do
    patch documentation_url(@documentation), params: { documentation: { name: @documentation.name, type: @documentation.type, uploaded_by_id: @documentation.uploaded_by_id } }, as: :json
    assert_response :success
  end

  test "should destroy documentation" do
    assert_difference("Documentation.count", -1) do
      delete documentation_url(@documentation), as: :json
    end

    assert_response :no_content
  end
end
