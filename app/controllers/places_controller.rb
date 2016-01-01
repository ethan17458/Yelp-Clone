class PlacesController < ApplicationController
  include ReviewsHelper
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:update, :edit, :destroy]
  before_action :check_login, only: [:new, :edit]

  # GET /places
  # GET /places.json
  def index
    redirect_to root_path
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place = Place.find_by(id: params[:id])
    @review = Review.new
    @reviews = Review.where(reviewed_place: @place.id)
  end

  # GET /places/new
  def new
    if logged_in?
      @place = Place.new
    else
      flash[:danger] = "You have to be logged in to do that"
      redirect_to root_path
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find_by(id: params[:id])
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Check if current user is owner
    def check_owner
      if !current_user.nil?
        if current_user.id.to_i == params[:owner].to_i || current_user.id.to_i == Place.find_by(id: params[:id]).owner.to_i
          return true
        else
          flash[:danger] = "You don't own this place"
          redirect_to root_path
        end
      else
        flash[:danger] = "You are not logged in"
        redirect_to root_path
      end
    end

    def check_login
      if logged_in?
        return true
      else
        flash[:danger] = "You have to be logged in to do that"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :description, :owner)
    end
end
