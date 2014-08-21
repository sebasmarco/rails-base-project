class Admin::AdministratorsController < AdminController
  def index
    @administrators = Fetchers::Users::FetchAdministratorsService.decorated(params)
  end

  def new
    @administrator = Admin.new
  end

  def create
    @administrator        = Admin.new(admin_params)
    @administrator.roles  = %w[admin]
    
    if @administrator.save
      flash[:success] = ''
      redirect_to redirect_url
      return false
    else
      render :new
    end
  end

  def edit
    @administrator = Admin.find(params[:id])
  end

  def update
    @administrator = Admin.find(params[:id])
    
    if @administrator.update_attributes(admin_params)
      flash[:success] = ''
      redirect_to redirect_url
      return false
    else
      render :edit
    end
  end

  def destroy
    if Admin.count > 0 and params[:id].to_i != current_user.id
      @administrator = Admin.find(params[:id])
      @administrator.destroy
      
      flash[:success]
    end
    
    redirect_to admin_administrators_path
    return false
  end
  
  private
    def admin_params
      params.require(:admin).permit(:name, :email, :avatar, :password, :password_confirmation)
    end
    
    def redirect_url
      (params[:add_more]) ? new_admin_administrator_path : edit_admin_administrator_path(@administrator)
    end
end
