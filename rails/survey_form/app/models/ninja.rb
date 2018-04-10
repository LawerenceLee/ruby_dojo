class Ninja < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 2 }
    validates :location, :language, presence: true
end
