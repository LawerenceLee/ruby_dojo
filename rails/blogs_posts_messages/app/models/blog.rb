class Blog < ActiveRecord::Base
    has_many :owners
    has_many :posts, dependent: :delete_all
    has_many :comments, as: :model
    validates :name, :description, presence: true
end

