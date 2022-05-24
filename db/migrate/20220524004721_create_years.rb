class CreateYears < ActiveRecord::Migration[7.0]
  def change
    create_table :years do |t|
      t.integer :user_id
      t.string :year_number, null: false
      t.timestamps
    end
    add_index :years, :user_id
  end
end
