class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.integer :shift, null: false
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
