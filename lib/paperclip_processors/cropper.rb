module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if @attachment.instance.cropping?
        crop_command
      else
        super
      end
    end
    
    def crop_command
      target = @attachment.instance
      if target.cropping?
        sTransform = "#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}"
        sTransform = ('"'+sTransform+'"')
        trans = []
        trans = trans << "-crop" << sTransform
        trans << "-resize" << "\"800x200\""
        trans 
      end
    end
  end
end