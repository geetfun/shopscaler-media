class PicturesController < ApplicationController
  
  layout "default"
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = PictureUpload.new
  end
  
  def show
    
  end
  
  def create
    @picture = PictureUpload.new(params[:picture_upload])
    if @picture.save
      flash[:success] = "Successfully saved picture"
      redirect_to :action => :index
    else
      flash.now[:error] = "Error saving picture"
      render :action => :new
    end
  end
  
  def destroy
    
  end
  
end
