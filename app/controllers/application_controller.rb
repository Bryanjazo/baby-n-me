class ApplicationController < ActionController::API
    helper_method :current_user, :logged_in? 

    def current_user
        @current_user ||= Api::V1::User.find_by(session[:uid]) if session[:uid]
    end

    def logged_in? 
        !!current_user
    end

    def require_user
    if !logged_in?
        flash[:error] = "You Must Be Logged In"

    end
    end
end
