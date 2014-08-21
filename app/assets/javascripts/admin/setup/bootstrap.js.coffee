root = exports ? this

class BootstrapSetup
  init: ->        
    $("a[rel=popover]").popover()
    $(".tooltip").tooltip()
    $("a[rel=tooltip]").tooltip()
    $("[data-toggle='tooltip'").tooltip()

unless root.BootstrapSetup
  root.BootstrapSetup = new BootstrapSetup