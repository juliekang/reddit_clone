class User < ActiveRecord::Base
  attr_accessible :password, :username
  attr_reader :password
  before_validation :ensure_session_token, :on => :create

  validates :password_digest, :username, :session_token, :presence => true
  validates :username, :session_token, :uniqueness => true
  validates :password, :length => { :minimum => 6 }, :if => :password_present?

  has_many :subs,
  :class_name => "Sub",
  :foreign_key => :moderator,
  :primary_key => :id

  has_many :links,
  :class_name => "Link",
  :foreign_key => :submitter,
  :primary_key => :id

  has_many :comments

  def password=(pw)
    @password = pw
    self.password_digest = BCrypt::Password.create(pw)
  end

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(user, pw)
    user = User.find_by_username(user)

    user if user && user.is_password?(pw)
  end

  def is_password?(pw)
    BCrypt::Password.new(self.password_digest).is_password?(pw)
  end

  def ensure_session_token
    self.session_token = self.class.generate_token
  end

  def reset_session_token
    ensure_session_token
  end

  def password_present?
    !self.password.nil?
  end

end
