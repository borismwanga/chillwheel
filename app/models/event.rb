class Event < ApplicationRecord
  belongs_to :user
  validates :title, :date, :difficulty, :start_point, :end_point, presence: true
  validates :description, presence: true, length: { minimum: 15 }
  validates :difficulty, presence: true, inclusion: { in: [1,2,3,4,5] }
end
