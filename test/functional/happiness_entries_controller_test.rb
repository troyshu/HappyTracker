require 'test_helper'

class HappinessEntriesControllerTest < ActionController::TestCase
  setup do
    @happiness_entry = happiness_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:happiness_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create happiness_entry" do
    assert_difference('HappinessEntry.count') do
      post :create, happiness_entry: { description: @happiness_entry.description, score: @happiness_entry.score }
    end

    assert_redirected_to happiness_entry_path(assigns(:happiness_entry))
  end

  test "should show happiness_entry" do
    get :show, id: @happiness_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @happiness_entry
    assert_response :success
  end

  test "should update happiness_entry" do
    put :update, id: @happiness_entry, happiness_entry: { description: @happiness_entry.description, score: @happiness_entry.score }
    assert_redirected_to happiness_entry_path(assigns(:happiness_entry))
  end

  test "should destroy happiness_entry" do
    assert_difference('HappinessEntry.count', -1) do
      delete :destroy, id: @happiness_entry
    end

    assert_redirected_to happiness_entries_path
  end
end
