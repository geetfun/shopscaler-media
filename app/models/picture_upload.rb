# *********************************************************************************************************************
# ~ Picture Upload
# 
# What this class does is inherit from the Picture class. Any file uploads destined to be a picture source will be
# passed through here. Paperclip will instantly resize the image to be a feedback thumbnail and then will pass to
# the delayed job queue to resize as appropriate
#
# Source: http://actsasblog.de/index.php/2009/05/28/paperclip-reprocess-in-background/
#
# *********************************************************************************************************************

class PictureUpload < Picture
  
  # *********************************************************************************************************************
  # ~ Paperclip Configuration
  # *********************************************************************************************************************
  public
    has_attached_file(
      :source,
      :styles => { :avatar => '50x50#' },
      :storage => :filesystem
    )
    
    # Call backs
    after_create :create_all_styles
    
  private
    def create_all_styles
      # TODO
    end
  
end