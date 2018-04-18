class User < ActiveRecord::Base
  has_secure_password
  before_validation :noramlize_email, on: :create

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :password, presence: true

  private
    def noramlize_email
      self.email = email.downcase
    end
end
