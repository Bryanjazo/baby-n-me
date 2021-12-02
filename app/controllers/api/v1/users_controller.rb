class Api::V1::UsersController < ApplicationController


  # GET /api/vi/users
  def index
    @api_v1_users = Api::V1::User.all
    
    render json: @api_v1_users
  end

  # GET /api/vi/users/1
  def show
    render json: @api_v1_users
  end

  # POST /api/vi/users
  def create
 
    url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=#{ENV['API_KEY']}"
 
      body = {
          email: params[:email],
          password: params[:password],
          returnSecureToken: true

      }

      resp = Faraday.post(url, JSON.generate(body), 'Content-Type' => 'application/json')
      data = JSON.parse(resp.body)
  
      if(data.key?('localId'))
    
        user = Api::V1::User.create(uid: data['localId'], username: params[:username])
        render json: user
      else
        render json: {error: "Invalid Email Format Or Email Already Exists"}
      end
  end

  # PATCH/PUT /api/vi/users/1
  def update
    if @api_v1_users.update(api_vi_user_params)
      render json: @api_v1_users
    else
      render json: @api_v1_users.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/vi/users/1
  def destroy
    @api_v1_users.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_vi_user
      @api_v1_users = Api::V1::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_vi_user_params
      params.fetch(:api_vi_user, {})
    end
end
