class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first
      t.string :last
      t.integer :age
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
