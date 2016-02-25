class AddArtToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :art, index: true, foreign_key: true
  end
end
