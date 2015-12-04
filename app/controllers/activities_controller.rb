class ActivitiesController < ApplicationController

  before_action :set_horse
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = @horse.activities.all
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = @horse.activities.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_horse
      @horse = current_user.horses.find(params[:horse_id])
    end

    def set_activity
      @activity = @horse.activities.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:user_id, :start_at, :end_at, :title, :description)
    end
end
