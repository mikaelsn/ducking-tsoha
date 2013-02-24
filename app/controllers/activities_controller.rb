class ActivitiesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :owns_activity, only: [:edit, :update, :destroy, :show]

  # GET /activities
  # GET /activities.json
  def index
    @activities = current_user.activities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
   # @exercise = Exercise.find(params[:exercise_id])
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @exercise = Exercise.find(params[:exercise_id])
    @activity = current_user.activities.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @exercise = Exercise.find(params[:exercise_id])
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @exercise = Exercise.find(params[:exercise_id])
    @activity = @exercise.activities.new(params[:activity])
    @activity.user = current_user

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @exercise, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])
    @exercise = Exercise.find(params[:exercise_id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @exercise, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @exercise = Exercise.find(params[:exercise_id])
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to @exercise }
      format.json { head :no_content }
    end
  end

  private

  def owns_activity
    if !user_signed_in? || current_user != Activity.find(params[:id]).user
      redirect_to exercise_path, notice: "You cannot do that!"
    end
  end  

end
