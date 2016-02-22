class AddAttachmentAvatarToArts < ActiveRecord::Migration
  def self.up
    change_table :arts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :arts, :avatar
  end
end
