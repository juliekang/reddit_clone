class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :parent_comment_id, :user_id

  validates :body, :link_id, :user_id, :presence => true

  belongs_to :link
  belongs_to :user
  belongs_to :parent_comment,
  :class_name => "Comment",
  :foreign_key => :parent_comment_id,
  :primary_key => :id

end
