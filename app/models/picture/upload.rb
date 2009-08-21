module Picture
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
      
    
  end
end