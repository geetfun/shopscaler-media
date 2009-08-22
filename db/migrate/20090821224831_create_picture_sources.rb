class CreatePictureSources < ActiveRecord::Migration
  def self.up
    create_table :picture_sources do |t|
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.datetime :updated_at
      t.string :state
      t.string :location
      t.timestamps
    end
  end

  def self.down
    drop_table :picture_sources
  end
end

#
#  id                  :integer         not null, primary key
#  source_file_name    :string(255)
#  source_content_type :string(255)
#  source_file_size    :integer
#  source_updated_at   :datetime
#  state               :string(255)
#