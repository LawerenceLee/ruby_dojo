class User < ActiveRecord::Base
  has_secure_password
  before_validation :noramlize_email, on: :create
  has_many :comment
  has_many :comments, through: :comment, source: :event

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :location, :state, presence: true


  def full_name
    self.first_name + " " + self.last_name
  end

  private
    def noramlize_email
      self.email = email.downcase
    end
end
