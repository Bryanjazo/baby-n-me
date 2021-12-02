class Api::V1::ChannelsController < ApplicationController
  before_action :set_api_v1_channel, only: [:show, :update, :destroy]

  # GET /api/v1/channels
  def index
    @api_v1_channels = Api::V1::Channel.all

    render json: @api_v1_channels
  end

  # GET /api/v1/channels/1
  def show
    render json: @api_v1_channel
  end

  # POST /api/v1/channels
  def create
    @api_v1_channel = Api::V1::Channel.new(api_v1_channel_params)

    if @api_v1_channel.save
      render json: @api_v1_channel, status: :created, location: @api_v1_channel
    else
      render json: @api_v1_channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/channels/1
  def update
    if @api_v1_channel.update(api_v1_channel_params)
      render json: @api_v1_channel
    else
      render json: @api_v1_channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/channels/1
  def destroy
    @api_v1_channel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_channel
      @api_v1_channel = Api::V1::Channel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_channel_params
      params.fetch(:api_v1_channel, {})
    end
end
