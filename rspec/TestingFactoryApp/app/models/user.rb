class User < ActiveRecord::Base
    validates :first_name, :last_name, :presence => true
    validates :email, presence: true, uniqueness: true
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
end