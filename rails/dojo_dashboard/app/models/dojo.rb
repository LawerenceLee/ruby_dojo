class Dojo < ActiveRecord::Base
    has_many :students, dependent: :delete_all 

    validates :branch, :street, :city, presence: true
    validates :state, presence: true, length: { is: 2 }
end
