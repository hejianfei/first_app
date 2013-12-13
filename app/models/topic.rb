class Topic < ActiveRecord::Base
  attr_accessible :category_id, :content, :essence, :feedback, :replies, :title, :top, :user_id, :valid, :views
  belongs_to :user
  has_many :replies
  validates :title, :length => { :min => 2, :maximum => 20 }

  def add_reply_count
  	self.reply_count += 1
  	self.save
  end
end
