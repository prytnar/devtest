class TargetGroupsController < ApplicationController
  before_action :set_target_group, only: [:show, :update, :destroy]

  # GET /target_groups
  def index
    @target_groups = TargetGroup.all

    render json: @target_groups
  end

  # GET /target_groups/:country_code
  def index_by_country_code
    @target_groups = TargetGroup.all_for_country_code(params[:country_code])

    render json: @target_groups    
  end

  # GET /target_groups/1
  def show
    render json: @target_group
  end

  # POST /target_groups
  def create
    @target_group = TargetGroup.new(target_group_params)

    if @target_group.save
      render json: @target_group, status: :created, location: @target_group
    else
      render json: @target_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /target_groups/1
  def update
    if @target_group.update(target_group_params)
      render json: @target_group
    else
      render json: @target_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /target_groups/1
  def destroy
    @target_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_target_group
      @target_group = TargetGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def target_group_params
      params.require(:target_group).permit(:references, :name, :external_id, :parent_id, :secret_code)
    end
end
