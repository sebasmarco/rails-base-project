root = exports ? this

class UnveilSetup
  init: ->        
    $("img").unveil()

unless root.UnveilSetup
  root.UnveilSetup = new UnveilSetup