class Spot < ApplicationRecord
  belongs_to :user
  validates :comment, :category, :location, :active, presence: true
end
