class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :owner_id
      t.string :source_file_name
      t.string :source_content_type
      t.integer :source_file_size
      t.datetime :source_updated_at
    end
  end

  def self.down
    drop_table :pictures
  end
end
