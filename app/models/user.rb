# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  name                :string(255)      default(""), not null
#  email               :string(255)      default(""), not null
#  disabled            :boolean          default(FALSE)
#  disabled_at         :datetime
#  crypted_password    :string(255)      not null
#  password_salt       :string(255)      not null
#  persistence_token   :string(255)      not null
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer          default(0)
#  failed_login_count  :integer          default(0)
#  last_request_at     :datetime
#  last_login_at       :datetime
#  current_login_at    :datetime
#  last_login_ip       :string(255)
#  current_login_ip    :string(255)
#  roles_mask          :integer          default(0)
#  type                :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base
  # == Constantes
  ROLES = %w[admin]
  
  # == Asociaciones
  
  # == Validaciones
  validates_presence_of   :name,  message: "Debes ingresar el nombre completo."
  validates_presence_of   :email, message: "Debes ingresar un correo electrónico válido."
  validates_uniqueness_of :email, message: "Este correo electrónico ya se encuentra registrado en el sistema. Por favor ingresa uno nuevo."
  validates_format_of     :email, with: Authlogic::Regex.email, message: "Debes ingresar un correo electrónico válido."
  
  # == Modules
  acts_as_authentic do |config|
    config.login_field = 'email'
  	config.validate_login_field = false
  	config.validate_email_field = false
  	
  	config.merge_validates_confirmation_of_password_field_options message:  "Las contraseñas ingresadas no coinciden."  
  	config.merge_validates_length_of_password_field_options message:        "La contraseña debe tener al menos 4 carácteres."
  	merge_validates_length_of_password_confirmation_field_options	message:  "La confirmación debe tener al menos 4 carácteres."
  end  
  
  # == Imagen de Perfil
  has_attached_file :avatar, styles: { 
		thumb:  "50x50#",
		small:  "100x100#",
		medium: "400x400#"
	}, 
	path: "/#{ENV['APP_NAME']}/users/:attachment/:id/:style/:basename.:extension"
	
	validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
	
	# == Metodos
	
	# Roles
	def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role.to_s)
  end
  
  #
end
