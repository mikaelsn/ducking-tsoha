class ExercisesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :owns_exercise, only: [:edit, :update, :destroy, :show]

  # GET /exercises
  # GET /exercises.json
  def index
    @exercises = current_user.exercises

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exercises }
    end
  end

  # GET /exercises/1
  # GET /exercises/1.json
  def show
    @exercise = Exercise.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/new
  # GET /exercises/new.json
  def new
    @exercise = current_user.exercises.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exercise }
    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = Exercise.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.json
  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.user = current_user

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully created.' }
        format.json { render json: @exercise, status: :created, location: @exercise }
      else
        format.html { render action: "new" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exercises/1
  # PUT /exercises/1.json
  def update
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        format.html { redirect_to @exercise, notice: 'Exercise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.json
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to exercises_url }
      format.json { head :no_content }
    end
  end

  private

  def owns_exercise
    if !user_signed_in? || current_user != Exercise.find(params[:id]).user
      redirect_to exercises_path, notice: "That is not yours!"
    end
  end

end
