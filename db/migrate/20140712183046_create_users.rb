class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,   null: false, default: ''
      t.string    :email,  null: false, default: ''
      
      t.boolean   :disabled,    default: false
      t.datetime  :disabled_at
      
      ## Autenticacion
      t.string    :crypted_password,  null: false
      t.string    :password_salt,     null: false
      
      t.string    :persistence_token, null: false
      t.string    :single_access_token
      t.string    :perishable_token
      
      t.integer   :login_count,         default: 0
      t.integer   :failed_login_count,  default: 0
      
      t.datetime  :last_request_at
      t.datetime  :last_login_at
      t.datetime  :current_login_at
      t.string    :last_login_ip
      t.string    :current_login_ip
      
      ## Roles
      t.integer   :roles_mask, default: 0
      t.string    :type
      
      ## Paperclip
      t.attachment  :avatar

      t.timestamps
    end
    
    add_index :users, :email, unique: true
    add_index :users, :persistence_token,     name: "users_persistence_token"
    add_index :users, :single_access_token ,  name: "users_single_access_token"
  end
end
