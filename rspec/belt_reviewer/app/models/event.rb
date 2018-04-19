class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendee
  has_many :attendees, through: :attendee, source: :user
  has_many :comments
  has_many :commented, through: :comment, source: :user

  validates :name, :location, :event_date, :state, :user, presence: true
  validate :date_checker

  
  def formatted_date
    self.event_date.strftime("%B %-d, %Y")
  end

  private
    def date_checker
      if event_date.present? && event_date < Date.today
        errors.add(:event_date, "can't be in the past")
      end
    end
end
