class SpotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spot, only: %i[ show edit update destroy ]

  # GET /spots or /spots.json
  def index
    @spot = Spot.new
    @spots = Spot.all
    # The `geocoded` scope filters only spots with coordinates
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        category: spot.category,
        info_window: render_to_string(partial: "info_window", locals: {spot: spot}),
        # image_url: helpers.asset_url("circle_accident.png")
        image_url: category_marker(spot)
      }
    end


    @stolen_bike_count = Spot.all.where(category: "Stolen bike").count
    @accident_count = Spot.all.where(category: "Accident").count

  end

  def stolen_bike
    @spots = Spot.all.where(category: "Stolen bike")
    @comment = Comment.new
    # TODO : add --> spot.nearbys(5) to show only nearby spots
  end

  # GET /spots/1 or /spots/1.json
  def show
    @comment = Comment.new
    @comments = Comment.all.where(spot_id: @spot.id)
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots or /spots.json
  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    respond_to do |format|
      if @spot.save
        format.html { redirect_to spot_url(@spot), notice: "Spot was successfully created." }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1 or /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to spot_url(@spot), notice: "Spot was successfully updated." }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1 or /spots/1.json
  def destroy
    @spot.destroy

    respond_to do |format|
      format.html { redirect_to spots_url, notice: "Spot was successfully destroyed." }
      format.json { head :no_content }
    end

    def article_params
      params.require(:article).permit(:title, :body, :photo)
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spot_params
    params.require(:spot).permit(:comment, :category, :location, :acitve, :user_id, :photo)
  end

  def category_marker(spot)
    if spot.category == "Accident"
      return helpers.asset_url("circle_accident.png")
    else
      return helpers.asset_url("circle_stolen_bike.png")
    end
  end
end
