root = exports ? this

class FilestyleSetup
  init: ->        
    $('.form-control-upload-styled').filestyle(
      icon:       false
      input:      false
      buttonName: "btn-secondary"
      buttonText: "Subir Imagen"
    )

unless root.FilestyleSetup
  root.FilestyleSetup = new FilestyleSetup