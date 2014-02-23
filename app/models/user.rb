class User < ActiveRecord::Base
  attr_accessible :mobile, :name, :password,:email, :ip, :state, :admin, :is_forecaster
  has_many :topics

  scope :valid, -> { where(state: 1) }
end
