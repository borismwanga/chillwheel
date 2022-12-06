class Comment < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }

  after_create :send_notification_email

  private

  def send_notification_email
    UserMailer.notification(self.spot.user, self.spot).deliver_now
  end
end
