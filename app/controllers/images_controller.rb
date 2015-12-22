class ImagesController < ApplicationController

  # We really shouldn't have to do that...
  before_filter { request.format = :json }

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def create
    @image = current_user.images.create({ image: params[:file] })
    render 'show.json', status: :created
  end
end

