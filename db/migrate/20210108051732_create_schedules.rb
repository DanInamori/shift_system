class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name, null: false
      t.date :first_day, null: false
      t.date :last_day, null: false
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
