class HorsesController < ApplicationController

  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @horses = current_user.horses
    respond_with(@horses)
  end

  def show
    @subtitle = @horse.to_label
    respond_with(@horse)
  end

  def new
    @horse = Horse.new
    @subtitle = t('.new_horse')
    respond_with(@horse)
  end

  def edit
    @subtitle = t('.edit', name: @horse.to_label)
  end

  def create
    @horse = Horse.new(horse_params)
    @horse.owner = current_user
    @horse.save
    respond_with(@horse)
  end

  def update
    @horse.update(horse_params)
    respond_with(@horse)
  end

  def destroy
    @horse.destroy
    respond_with(@horse)
  end

  private

  def set_horse
    @horse = Horse.find(params[:id])
  end

  def horse_params
    params.require(:horse).permit(:name, :nick, :birth, :height, :gender_id, :color_id, :dentist, :vet, :blacksmith, :osteopath, 
                                  :blanket_size, :strap_size, :horsebit_size, :bridle_size, :comment)
  end
end

