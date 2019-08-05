class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :attending, null: false
      t.string :diet, null: false, default: ''
      t.string :comments, null: false, default: ''

      t.timestamps
    end
  end
end
