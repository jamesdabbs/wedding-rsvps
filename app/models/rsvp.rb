class Rsvp < ApplicationRecord
  has_many :pluses, class_name: 'RsvpPlus', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :attending, presence: true

  def any_attending?
    attending == 'yes' || pluses.any? { |plus| plus.attending == 'yes' }
  end

  def deliver
    RsvpMailer.rsvp(self).deliver_now
  end
end
