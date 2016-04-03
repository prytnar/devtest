class PanelProvidersController < ApplicationController
  before_action :set_panel_provider, only: [:show, :update, :destroy]

  # GET /panel_providers
  def index
    @panel_providers = PanelProvider.all

    render json: @panel_providers
  end

  # GET /panel_providers/1
  def show
    render json: @panel_provider
  end

  # POST /panel_providers
  def create
    @panel_provider = PanelProvider.new(panel_provider_params)

    if @panel_provider.save
      render json: @panel_provider, status: :created, location: @panel_provider
    else
      render json: @panel_provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /panel_providers/1
  def update
    if @panel_provider.update(panel_provider_params)
      render json: @panel_provider
    else
      render json: @panel_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /panel_providers/1
  def destroy
    @panel_provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel_provider
      @panel_provider = PanelProvider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def panel_provider_params
      params.require(:panel_provider).permit(:code)
    end
end
