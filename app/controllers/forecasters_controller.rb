# -*- coding: utf-8 -*-
class ForecastersController < ApplicationController
  before_filter :user_online, :only => [:new]

  def new
  	@forecaster = Forecaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forecaster }
    end
  end

  def create
	  @forecaster = Forecaster.new(params[:forecaster])
    user_id = params[:forecaster][:user_id]
    forecasters = Forecaster.where("user_id=?",user_id)
    if forecasters.size > 0
      redirect_to forecasters[0], notice:"您已经申请过预测师，请保持电话畅通，谢谢！"
    else
      @forecaster.state = 0
      respond_to do |format|
        if @forecaster.save
          user = User.find_by_id(user_id)
          user.is_forecaster = 0
          user.save
          format.html { redirect_to @forecaster, notice: '申请成为预测师请求已发出，请等待管理员与您联系.' }
          format.json { render json: @forecaster, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @forecaster.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show
  	@forecaster = Forecaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forecaster }
    end
  end

  def update

  end
end
