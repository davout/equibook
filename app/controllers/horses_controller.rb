class HorsesController < ApplicationController
  before_action :set_horse, only: [:show, :edit, :update, :destroy]

  # GET /horses
  # GET /horses.json
  def index
    @horses = current_user.horses
  end

  # GET /horses/1
  # GET /horses/1.json
  def show
  end

  # GET /horses/new
  def new
    @horse = Horse.new
  end

  # GET /horses/1/edit
  def edit
  end

  # POST /horses
  # POST /horses.json
  def create
    @horse = Horse.new(horse_params)
    @horse.users << current_user

    respond_to do |format|
      if @horse.save
        format.html { redirect_to @horse, notice: t('.created') }
        format.json { render :show, status: :created, location: @horse }
      else
        format.html { render :new }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horses/1
  # PATCH/PUT /horses/1.json
  def update
    respond_to do |format|
      if @horse.update(horse_params)
        format.html { redirect_to @horse, notice: t('.updated') }
        format.json { render :show, status: :ok, location: @horse }
      else
        format.html { render :edit }
        format.json { render json: @horse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horses/1
  # DELETE /horses/1.json
  def destroy
    @horse.destroy
    respond_to do |format|
      format.html { redirect_to horses_url, notice: t('.destroyed') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_horse
    @horse = Horse.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def horse_params
    params.require(:horse).permit(:name, :nick, :birth, :height, :gender_id, :color_id, :dentist, :vet, :blacksmith, :osteopath, 
                                  :blanket_size, :strap_size, :horsebit_size, :bridle_size, :comment)
  end
end
