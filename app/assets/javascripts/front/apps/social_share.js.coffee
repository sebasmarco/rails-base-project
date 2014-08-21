root = exports ? this

class SocialShareApp
  init: (options = {}) ->
    _.defaults options,
      button: $("[data-toggle='social']") 
    
    { @button } = options
    
    @setupBindings()
    
  setupBindings: ->
    @button.on 'click', (e) =>
      e.preventDefault()
    
      @openDialog $(e.currentTarget)
      
  openDialog: (el)->
    url     = el.data 'url'
    type    = el.data 'type'
    width   = el.data 'width'
    height  = el.data 'height'
    
    window.open url, type, "width=#{width},height=#{height}"

unless root.SocialShareApp
  root.SocialShareApp = new SocialShareApp