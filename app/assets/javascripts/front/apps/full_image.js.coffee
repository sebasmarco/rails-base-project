root = exports ? this

class FullImageApp
  init: (options = {}) ->
    _.defaults options,
      imageContainer: $('.full-image')   
      offset:         0     
    
    { @imageContainer, @offset } = options
    
    @setupBindings()
    @setHeightToViewport()
    
  setupBindings: ->
    $(window).resize =>
      @setHeightToViewport()
  
  setHeightToViewport: ->
    height = $(window).height() - @offset
    
    @imageContainer.css 'height', height

unless root.FullImageApp
  root.FullImageApp = new FullImageApp