class Spot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :comment, :location, presence: true
  validates :category, presence: true, inclusion: { in: ["Stolen bike", "Accident"] }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
