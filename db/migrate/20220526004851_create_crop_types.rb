class CreateCropTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :crop_types do |t|
      t.integer :year_id
      t.string :name, null: false
      t.timestamps
    end
    add_index :crop_types, :year_id
  end
end
