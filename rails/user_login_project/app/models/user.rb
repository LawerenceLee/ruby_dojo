class User < ActiveRecord::Base
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email_address, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
    validates :first_name, :last_name, presence: true, length: { in: 2..20 }
    validates :age, presence: true, numericality: true, inclusion: { in: 10..150, message: "must be between 10-150" }

end
