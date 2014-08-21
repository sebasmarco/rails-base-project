#encoding: utf-8
class BaseForm
	# == Modules
  include ActiveModel::Model
  
  def featured?
    if self.featured == "0"
      false
    elsif self.featured == "1"
      true
    else
      self.featured
    end
  end
  
  def visible?
    if self.visible == "0"
      false
    elsif self.visible == "1"
      true
    else
      self.visible
    end
  end
  
  def convert_date_to_string(date)
    date.strftime("%d-%m-%Y") if date
  end
end