root = exports ? this

class RetinaSetup
  init: ->        
    $('img').retina()

unless root.RetinaSetup
  root.RetinaSetup = new RetinaSetup