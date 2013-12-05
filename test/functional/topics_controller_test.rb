require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create topic" do
    assert_difference('Topic.count') do
      post :create, topic: { category_id: @topic.category_id, content: @topic.content, essence: @topic.essence, feedback: @topic.feedback, replies: @topic.replies, title: @topic.title, top: @topic.top, user_id: @topic.user_id, valid: @topic.valid, views: @topic.views }
    end

    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should show topic" do
    get :show, id: @topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @topic
    assert_response :success
  end

  test "should update topic" do
    put :update, id: @topic, topic: { category_id: @topic.category_id, content: @topic.content, essence: @topic.essence, feedback: @topic.feedback, replies: @topic.replies, title: @topic.title, top: @topic.top, user_id: @topic.user_id, valid: @topic.valid, views: @topic.views }
    assert_redirected_to topic_path(assigns(:topic))
  end

  test "should destroy topic" do
    assert_difference('Topic.count', -1) do
      delete :destroy, id: @topic
    end

    assert_redirected_to topics_path
  end
end
