class User < ActiveRecord::Base
  attr_accessible :admin, :email, :ip, :mobile, :name, :password
  has_many :topics
end
