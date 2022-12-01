class Spot < ApplicationRecord
  belongs_to :user
  validates :comment, :location, presence: true
  validates :category, presence: true, inclusion: { in: ["Works", "Damage road", "Dangerous junction", "Accident"] }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
