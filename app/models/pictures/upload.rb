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
  class Upload < Source
    # *********************************************************************************************************************
    # ~ Paperclip Configuration
    # *********************************************************************************************************************
    public
      has_attached_file(
        :source,
        :styles => { :avatar => '50x50#' },
        :storage => :filesystem
      )
      
    # *********************************************************************************************************************
    # ~ Paperclip Configuration
    # *********************************************************************************************************************
    public
      validates_attachment_presence :source

    # *********************************************************************************************************************
    # ~ Post processing
    # => It is here we send the file to the source model where it will be processed in the background by delayed_job
    # *********************************************************************************************************************
    public
      # Call backs
      after_create :create_all_styles

    private
      def create_all_styles
        Delayed::Job.enqueue PictureJob.new(self.id)
      end
  end
end
