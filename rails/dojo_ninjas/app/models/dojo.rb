class Dojo < ActiveRecord::Base
    has_many :ninjas, dependent: :delete_all
    validates :name, :city, :state, presence: true
    validates :state, presence: true, length: { is: 2 }
end
