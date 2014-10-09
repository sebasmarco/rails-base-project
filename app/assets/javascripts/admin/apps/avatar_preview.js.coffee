root = exports ? this

class AvatarPreviewApp
  init: (options = {}) ->
    _.defaults options,
      toggleInput:  $('[data-toggle="avatar-preview"]')
    
    { @toggleInput, } = options
        
    @setupBindings()
  
  setupBindings: ->
    @toggleInput.on 'change', (e) =>
      @changeAvatar e
  
  changeAvatar: (e) ->
    e.stopPropagation()
    e.preventDefault()
    
    fileInput = $(e.currentTarget)
    newAvatar = e.target.files[0]
    
    unless newAvatar.type.match(/image.*/i)
      fileInput.replaceWith(fileInput.val('').clone(true))
    else
      avatarFile = newAvatar
      
      reader = new FileReader()
      reader.onloadend = =>
        @updateAvatarImage reader.result, fileInput
      reader.readAsDataURL avatarFile 
    
    false
  
  updateAvatarImage: (image, fileInput) ->
    container = $(fileInput.data('container'))
    container.attr 'src', "#{image}"

unless root.AvatarPreviewApp
  root.AvatarPreviewApp = new AvatarPreviewApp