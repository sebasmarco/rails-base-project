root = exports ? this

class NProgressSetup
  init: ->        
    $(document).on "page:fetch",    -> NProgress.start()
    $(document).on "page:change",   -> NProgress.done()
    $(document).on "page:restore",  -> NProgress.remove()

unless root.NProgressSetup
  root.NProgressSetup = new NProgressSetup