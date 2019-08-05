class RsvpPlus < ApplicationRecord
  self.table_name = :rsvp_pluses

  belongs_to :rsvp

  validates :name, presence: true
  validates :attending, presence: true
end
