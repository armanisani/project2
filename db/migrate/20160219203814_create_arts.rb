class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :name
      t.string :style
      t.integer :price
      t.string :details

      t.timestamps null: false
    end
  end
end
