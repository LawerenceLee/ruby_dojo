class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendee
  has_many :attendees, through: :attendee, source: :user

  validates :name, :event_date, :location, :state, :user, presence: true

  def formatted_date
    self.event_date.strftime("%B %-d, %Y")
  end
end
