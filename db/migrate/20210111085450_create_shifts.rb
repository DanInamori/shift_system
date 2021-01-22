class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :work_day
      t.time :clock_in
      t.time :clock_out
      t.string :check
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
