# -*- coding: utf-8 -*-
class TopicsController < ApplicationController
  before_filter :authorize, :only => [:edit, :delete]
  before_filter :user_online, :only => [:new, :create, :edit]
  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.where(:state => 1).paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
    @forecasters = User.where(:is_forecaster=>1, :state => 1).order('id DESC').limit(10)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @topic = Topic.find(params[:id])
    add_view (@topic) if @topic
    @reply = Reply.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    @topic = Topic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(params[:topic])
    @topic.feedback = 0
    @topic.state = 1
    @topic.views = 0
    @topic.top = 0
    @topic.user_id = session[:current_user].id
    @topic.essence = 0
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end

  def add_view (topic)
    topic.views = topic.views + 1 if topic
    topic.save
  end
end
