class Reply < ActiveRecord::Base
  attr_accessible :content, :is_valid, :top, :topic_id, :user_id
  belongs_to :topic
end
