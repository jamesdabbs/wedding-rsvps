class Rsvp < ApplicationRecord
  has_many :pluses, class_name: 'RsvpPlus'

  validates :name, presence: true
  validates :email, presence: true
  validates :attending, presence: true

  def deliver
    # RsvpMailer.rsvp(self).deliver_now
  end
end
