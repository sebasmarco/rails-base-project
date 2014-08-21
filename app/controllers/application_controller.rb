class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user
  
  protected
    def require_user
      unless current_user
        redirect_to root_url
        return false
      end
    end
    
    def require_admin
      unless current_user && current_user.is?('admin')
        redirect_to admin_login_url
        return false
      end
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end
end