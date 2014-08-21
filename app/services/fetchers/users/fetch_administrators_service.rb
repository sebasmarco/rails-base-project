class Fetchers::Users::FetchAdministratorsService < BaseService
  def self.execute(params = {})
    limit = params[:limit].present? ? params[:limit].to_i : 30
  
    administrators = Admin.page(params[:page]).per(limit)
    administrators = administrators.order(:name)
    
    if params[:query].present?
      q = "%#{params[:query].downcase}%"    
      administrators = administrators.where("LOWER(users.name) LIKE ? OR LOWER(users.email) LIKE ?", q, q) 
    end
    
    administrators = administrators.order('users.created_at DESC')
    
    administrators
  end
  
  def self.decorated(params = {})
    administrators = self.execute(params)
    administrators = AdminDecorator.decorate_collection(administrators)
    administrators
  end
end