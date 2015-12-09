class ImagesController < ApplicationController

  respond_to :json

  def show
    @image = Image.find(params[:id])
    render json: { link: @image.image.url }
  end

  def create
    @image = Image.new({ image: params[:file] })

    if @image.save
      render json: { link: @image.image.url }, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

end
