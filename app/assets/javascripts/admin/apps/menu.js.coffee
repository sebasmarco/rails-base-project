root = exports ? this

class MenuApp
  init: (options = {}) ->
    _.defaults options,
      toggleButton:  $('[data-toggle="admin-sidebar"]')
      wrapper:       $('.wrapper')
    
    { @toggleButton, @wrapper } = options
        
    @setupBindings()
  
  setupBindings: ->
    @toggleButton.on 'click', (e) =>
      e.preventDefault()
      
      @wrapper.toggleClass 'sidebar-toggle'

unless root.MenuApp
  root.MenuApp = new MenuApp