class CreatePictureUploads < ActiveRecord::Migration
  def self.up
    create_table :picture_uploads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :picture_uploads
  end
end
