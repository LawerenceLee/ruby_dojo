class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, as: :model
  validates :author, :user, presence: true
  validates :content, presence: true, length: { minimum: 15}
end
