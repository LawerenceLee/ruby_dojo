class User < ActiveRecord::Base
    validates :username, presence: true, length: { minimum: 5 }, uniqueness: true
end
