class Api::V1::SellingsController < ApplicationController
  before_action :set_api_v1_selling, only: [:show, :update, :destroy]

  # GET /api/v1/sellings
  def index
    @api_v1_sellings = Api::V1::Selling.all

    render json: @api_v1_sellings
  end

  # GET /api/v1/sellings/1
  def show
    render json: @api_v1_selling
  end

  # POST /api/v1/sellings
  def create
    @api_v1_selling = Api::V1::Selling.new(api_v1_selling_params)

    if @api_v1_selling.save
      render json: @api_v1_selling, status: :created, location: @api_v1_selling
    else
      render json: @api_v1_selling.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/sellings/1
  def update
    if @api_v1_selling.update(api_v1_selling_params)
      render json: @api_v1_selling
    else
      render json: @api_v1_selling.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/sellings/1
  def destroy
    @api_v1_selling.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_selling
      @api_v1_selling = Api::V1::Selling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_selling_params
      params.fetch(:api_v1_selling, {})
    end
end
