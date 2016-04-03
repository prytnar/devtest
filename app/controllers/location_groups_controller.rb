class LocationGroupsController < ApplicationController
  before_action :set_location_group, only: [:show, :update, :destroy]

  # GET /location_groups
  def index
    @location_groups = LocationGroup.all

    render json: @location_groups
  end

  # GET /location_groups/1
  def show
    render json: @location_group
  end

  # POST /location_groups
  def create
    @location_group = LocationGroup.new(location_group_params)

    if @location_group.save
      render json: @location_group, status: :created, location: @location_group
    else
      render json: @location_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /location_groups/1
  def update
    if @location_group.update(location_group_params)
      render json: @location_group
    else
      render json: @location_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /location_groups/1
  def destroy
    @location_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_group
      @location_group = LocationGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_group_params
      params.require(:location_group).permit(:references, :references, :name)
    end
end
