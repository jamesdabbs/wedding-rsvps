class CreateRsvpPlus < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvp_pluses do |t|
      t.belongs_to :rsvp, null: false, foreign_key: true
      t.string :name, null: false
      t.string :attending, null: false
    end
  end
end
