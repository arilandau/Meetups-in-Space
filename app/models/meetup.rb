class Meetup < ActiveRecord::Base
  has_many :users, through: :attendances
  has_many :attendances

  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :creator, presence: true
end
