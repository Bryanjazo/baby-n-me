module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect 
      self.current_user = find_verified_user
    end

    private 

    def find_verified_user
      access_token = request.params[:'access_token']
      client_id = request.params[:client]
      verified_user = Api::V1::User.find_by(uid: client_id)

      if verified_user && verified_user.valid_token?(access_token, client_id)
        verified_user
      else

        reject_unathorized_connection
      end
    end
  end
end
