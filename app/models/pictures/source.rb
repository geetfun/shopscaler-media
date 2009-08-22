# == Schema Information
# Schema version: 20090821224831
#
# Table name: pictures_sources
#
#  id           :integer(4)      not null, primary key
#  file_name    :string(255)
#  content_type :string(255)
#  file_size    :integer(4)
#  updated_at   :datetime
#  state        :string(255)
#  location     :string(255)
#  created_at   :datetime
#

module Pictures
  class Source < ActiveRecord::Base
    # Sets the table name, as it cannot be automatically inferred by ActiveRecord
    set_table_name "pictures_sources"
    
    # *********************************************************************************************************************
    # ~ Paperclip Configuration
    # *********************************************************************************************************************
    public
      has_attached_file(
        :source,
        :styles => {
          :bigger => '1600x1600>',
          :big => '800x600',
          :album => '560x420>',
          :album_preview => '150x150>',
          :album_folder => '70x70#',
          :profile => '180x250>',
          :avatar => '50x50#'
        },
        :storage => :filesystem,
        :url => "/images/pictures/:id/:style/:basename.:extension",
        :path => ":rails_root/public/images/pictures/:id/:style/:basename.:extension"
      )
      
    # *********************************************************************************************************************
    # ~ AASM
    # *********************************************************************************************************************
    public
      include AASM

      # For whether it is processed or not
      # -------------------------------------------------
      aasm_column :state
      aasm_initial_state :pending

      aasm_state :pending
      aasm_state :error
      aasm_state :ready

      aasm_event :converted do
        transitions :to => :ready, :from => [:pending]
      end
      
      # For whether it is stored on S3 or here
      # -------------------------------------------------
      aasm_column :location
      aasm_initial_state :local
      
      aasm_state :local
      aasm_state :s3
      
      aasm_event :sent do
        transitions :to => :s3, :from => [:local]
      end
      
    # *********************************************************************************************************************
    # ~ Utility Methods
    # *********************************************************************************************************************
    public
      def url(style = :original)
        if self.ready?
          source.url(style)
        elsif ( style==:original || style==:avatar )
          source.url(style)
        else
          # Send a generic "Not ready / Processing" picture across the wire
        end
      end
  
  end
end
