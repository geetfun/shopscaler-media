class PicturesController < ApplicationController
  
  def index
    @pictures = ::Pictures::Source.all
  end
  
  def new
    @picture = ::Pictures::Upload.new
  end
  
  def show
    @picture = ::Pictures::Source.find(params[:id])
  end
  
  def create
    @picture = ::Pictures::Upload.new(params[:picture])
    if @picture.save
      flash[:success] = "Successfully saved picture"
      redirect_to :action => :index
    else
      flash.now[:error] = "Error saving picture"
      render :action => :new
    end
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "Picture #{@picture.id} deleted"
    redirect_to :action => :index
  end
  
end
