class Sub < ActiveRecord::Base
  attr_accessible :moderator, :name, :links_attributes

  validates :name, :uniqueness => true
  validates :moderator, :name, :presence => true

  has_many :links, :inverse_of => :sub

  belongs_to :moderating_user,
  :class_name => "User",
  :foreign_key => :moderator,
  :primary_key => :id

  accepts_nested_attributes_for :links, reject_if: :reject_link

  def reject_link(attributed)
    attributed['title'].blank? && attributed['url'].blank?
  end

end
