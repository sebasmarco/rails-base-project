class Admin::SessionsController < AdminController
  layout 'login'
  skip_before_filter :require_admin, only: [:new, :create]

  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    
    if @user_session.save
      redirect_to admin_root_url
      return false
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy if current_user_session
    
    redirect_to admin_login_url
    return false
  end
end