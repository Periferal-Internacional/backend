require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plant = plants(:one)
  end

  test "should get index" do
    get plants_url, as: :json
    assert_response :success
  end

  test "should create plant" do
    assert_difference("Plant.count") do
      post plants_url, params: { plant: { city: @plant.city, country: @plant.country } }, as: :json
    end

    assert_response :created
  end

  test "should show plant" do
    get plant_url(@plant), as: :json
    assert_response :success
  end

  test "should update plant" do
    patch plant_url(@plant), params: { plant: { city: @plant.city, country: @plant.country } }, as: :json
    assert_response :success
  end

  test "should destroy plant" do
    assert_difference("Plant.count", -1) do
      delete plant_url(@plant), as: :json
    end

    assert_response :no_content
  end
end
