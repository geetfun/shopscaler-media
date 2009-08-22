# == Schema Information
# Schema version: 20090821224831
#
# Table name: pictures
#
#  id                  :integer(4)      not null, primary key
#  source_file_name    :string(255)
#  source_content_type :string(255)
#  source_file_size    :integer(4)
#  source_updated_at   :datetime
#  state               :string(255)
#

class Picture < ActiveRecord::Base
  
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
      :storage => :filesystem
    )
  
  # *********************************************************************************************************************
  # ~ AASM
  # *********************************************************************************************************************
  public
    include AASM
    
    aasm_column :state
    aasm_initial_state :pending
    
    aasm_state :pending
    aasm_state :error
    aasm_state :ready
    
    aasm_event :converted do
      transitions :to => :ready, :from => [:pending]
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
        raise "SHIT"
      end
    end

end
