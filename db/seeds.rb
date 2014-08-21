Admin.delete_all
 
a = Admin.create!(name: "Juan Zumarán", email: "juan.zumaran@gitz.cl", password: "123123", password_confirmation: "123123")
a.roles = %w[admin]
a.save!

a = Admin.create!(name: "Carlos Gaete", email: "carlos.gaete@gitz.cl", password: "123123", password_confirmation: "123123")
a.roles = %w[admin]
a.save!