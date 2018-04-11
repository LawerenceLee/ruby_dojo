class Student < ActiveRecord::Base
  belongs_to :dojo

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :dojo, presence: true
end
