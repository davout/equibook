require 'test_helper'

class HorsesControllerTest < ActionController::TestCase
  setup do
    @horse = horses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:horses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create horse" do
    assert_difference('Horse.count') do
      post :create, horse: { birth: @horse.birth, blacksmith: @horse.blacksmith, blanket_size: @horse.blanket_size, bridle_size: @horse.bridle_size, color_id: @horse.color_id, comment: @horse.comment, dentist: @horse.dentist, gender: @horse.gender, height: @horse.height, horsebit_size: @horse.horsebit_size, name: @horse.name, nick: @horse.nick, osteopath: @horse.osteopath, strap_size: @horse.strap_size, vet: @horse.vet }
    end

    assert_redirected_to horse_path(assigns(:horse))
  end

  test "should show horse" do
    get :show, id: @horse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @horse
    assert_response :success
  end

  test "should update horse" do
    patch :update, id: @horse, horse: { birth: @horse.birth, blacksmith: @horse.blacksmith, blanket_size: @horse.blanket_size, bridle_size: @horse.bridle_size, color_id: @horse.color_id, comment: @horse.comment, dentist: @horse.dentist, gender: @horse.gender, height: @horse.height, horsebit_size: @horse.horsebit_size, name: @horse.name, nick: @horse.nick, osteopath: @horse.osteopath, strap_size: @horse.strap_size, vet: @horse.vet }
    assert_redirected_to horse_path(assigns(:horse))
  end

  test "should destroy horse" do
    assert_difference('Horse.count', -1) do
      delete :destroy, id: @horse
    end

    assert_redirected_to horses_path
  end
end
