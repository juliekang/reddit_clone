class Link < ActiveRecord::Base
  attr_accessible :description, :sub_id, :submitter, :title, :url
  attr_reader :comment_hash

  validates :sub, :submitter, :title, :url, :presence => true

  has_many :comments
  belongs_to :sub
  belongs_to :submitting_user,
  :class_name => "User",
  :foreign_key => :submitter,
  :primary_key => :id

  def comments_by_parent_id
    @indents = 0
    @comment_hash = Hash.new { |h,k| h[k] = [] }

    self.comments.each do |comment|
      @comment_hash[comment.parent_comment_id] << comment
    end
    @comment_hash
  end

end
