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

class Admin < User
  # == Scopes
  default_scope { order 'name DESC' }
end
