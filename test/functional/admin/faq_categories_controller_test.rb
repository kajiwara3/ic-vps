require 'test_helper'

class Admin::FaqCategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_faq_category = admin_faq_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_faq_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_faq_category" do
    assert_difference('Admin::FaqCategory.count') do
      post :create, admin_faq_category: @admin_faq_category.attributes
    end

    assert_redirected_to admin_faq_category_path(assigns(:admin_faq_category))
  end

  test "should show admin_faq_category" do
    get :show, id: @admin_faq_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_faq_category
    assert_response :success
  end

  test "should update admin_faq_category" do
    put :update, id: @admin_faq_category, admin_faq_category: @admin_faq_category.attributes
    assert_redirected_to admin_faq_category_path(assigns(:admin_faq_category))
  end

  test "should destroy admin_faq_category" do
    assert_difference('Admin::FaqCategory.count', -1) do
      delete :destroy, id: @admin_faq_category
    end

    assert_redirected_to admin_faq_categories_path
  end
end
