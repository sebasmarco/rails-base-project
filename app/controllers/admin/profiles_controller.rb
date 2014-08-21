class Admin::ProfilesController < AdminController
  def index
    @administrator = current_user
  end

  def update
    @administrator = current_user
    
    if @administrator.update_attributes(admin_params)
      flash[:success] = ''
      redirect_to admin_profiles_path
      return false
    else
      render :index
    end
  end
  
  private
    def admin_params
      params.require(:admin).permit(:avatar, :name, :email, :password, :password_confirmation)
    end
end
