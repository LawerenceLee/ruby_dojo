class Post < ActiveRecord::Base
  has_many :messages, dependent: :delete_all
  belongs_to :blog
  belongs_to :user
  validates :blog, :user, :content, presence: true
  validates :title, presence: true, length: { minimum: 7 }
end
