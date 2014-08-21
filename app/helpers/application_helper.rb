module ApplicationHelper
  def retina_tag(name, options = {})
    name_retina = name.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(name, options.merge("data-retina" => asset_path(name_retina)))
  end
end
