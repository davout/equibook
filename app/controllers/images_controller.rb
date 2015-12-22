class ImagesController < ApplicationController

  respond_to :json

  def show
    @image = Image.find(params[:id])
    respond_with(@image)
  end

  def create
    @image = current_user.images.create({ image: params[:file] })
    respond_with(@image)
  end

end
