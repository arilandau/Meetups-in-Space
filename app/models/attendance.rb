class Attendance < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user
  validates :user_id, presence: true, numericality: true
  validates :meetup_id, presence: true, numericality: true

end
