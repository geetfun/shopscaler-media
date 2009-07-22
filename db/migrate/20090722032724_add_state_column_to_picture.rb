class AddStateColumnToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :state, :string
  end

  def self.down
  end
end
