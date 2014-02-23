class Forecaster < ActiveRecord::Base
  attr_accessible :mobile, :name, :qq, :user_id
  validates :name, :length => { :min => 2, :maximum => 10 }
  validates :mobile, :length => { :min => 8, :maximum => 11 }

end
