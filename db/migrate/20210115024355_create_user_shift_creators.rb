class CreateUserShiftCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shift_creators do |t|
      t.references :user, foreign_key: true
      t.references :shift_creator, foreign_key: true
      t.timestamps
    end
  end
end
