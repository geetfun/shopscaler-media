class CreatePictureSources < ActiveRecord::Migration
  def self.up
    create_table :picture_sources do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :picture_sources
  end
end
