class User < ActiveRecord::Base
    has_many :owners, dependent: :delete_all
    has_many :blogs, through: :owners
    has_many :posts, dependent: :delete_all
    has_many :messages, dependent: :delete_all
    has_many :comments, as: :model

    validates :first_name, :last_name, presence: true, length: { minimum: 2}
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email_address, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
end
