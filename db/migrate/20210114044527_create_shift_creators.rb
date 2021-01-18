class CreateShiftCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :shift_creators do |t|
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
