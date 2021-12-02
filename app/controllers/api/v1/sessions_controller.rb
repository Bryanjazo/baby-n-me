class Api::V1::SessionsController < ApplicationController
  before_action :set_api_v1_session, only: [:show, :update, :destroy]

  # GET /api/v1/sessions
 

  # POST /api/v1/sessions
  def create
    url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=#{ENV['API_KEY']}"

    body = {
        email: session_params[:email],
        password: session_params[:password],
        returnSecureToken: true
    }
    resp = Faraday.post(url, JSON.generate(body), 'Content-Type' => 'application/json')
    data = JSON.parse(resp.body)
    if(data.key?('idToken'))
      user = User.find_by(uid: data['localId'])
      render json: user
    else
      render json: {error: "Invalid Email Or Password"}
    end
  end


  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
