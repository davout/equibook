class ActivitiesController < ApplicationController

  before_action :set_horse
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @subtitle = t('.title', horse: @horse.to_label)
    @activities = @horse.activities.all
    respond_with(@activities)
  end

  def show
    @subtitle = @activity.title
    respond_with(@activity)
  end

  def new
    @subtitle = t('.title', horse: @horse.to_label)
    @activity = Activity.new
    respond_with(@activity)
  end

  def edit
    @subtitle = t('.title', activity: @activity.title)
  end

  def create
    @activity = @horse.activities.new(activity_params)
    @activity.user = current_user
    @activity.save

    respond_with(@horse, @activity)
  end

  def update
    @activity.update(activity_params)
    respond_with(@horse, @activity)
  end

  def destroy
    @activity.destroy
    respond_with(@horse, @activity)
  end


  private

  def set_horse
    @horse = current_user.horses.find(params[:horse_id])
  end

  def set_activity
    @activity = @horse.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:user_id, :start_at, :end_at, :title, :description, image_ids: [])
  end
end

