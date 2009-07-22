class RemoveOwnerIdFromPictures < ActiveRecord::Migration
  def self.up
    remove_column :pictures, :owner_id
  end

  def self.down
  end
end
