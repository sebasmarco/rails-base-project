class AdminController < ApplicationController
  layout 'admin'
  before_filter :require_admin
  
  # == Metodos
end