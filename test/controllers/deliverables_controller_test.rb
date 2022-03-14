require "test_helper"

class DeliverablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deliverable = deliverables(:one)
  end

  test "should get index" do
    get deliverables_url, as: :json
    assert_response :success
  end

  test "should create deliverable" do
    assert_difference("Deliverable.count") do
      post deliverables_url, params: { deliverable: { approved: @deliverable.approved, comment: @deliverable.comment, user_id: @deliverable.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show deliverable" do
    get deliverable_url(@deliverable), as: :json
    assert_response :success
  end

  test "should update deliverable" do
    patch deliverable_url(@deliverable), params: { deliverable: { approved: @deliverable.approved, comment: @deliverable.comment, user_id: @deliverable.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy deliverable" do
    assert_difference("Deliverable.count", -1) do
      delete deliverable_url(@deliverable), as: :json
    end

    assert_response :no_content
  end
end
