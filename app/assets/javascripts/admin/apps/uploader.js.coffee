root = exports ? this

class UploaderApp
  init: (options = {}) ->
    _.defaults options,
      dropzone:             $("#upload-image-container")
      errorContainer:       $('#image-upload-error')
      imageContainer:       $("#gallery-image-container")
      uploadContainer:      $("#upload-image-container")
      uploadForm:           $("#upload-form")
      uploadInput:          $("#upload-file-input")
      url:                  "/"
      
      allowedTypes:         ['png', 'gif', 'jpg', 'jpeg']
      dataType:             'json'
      maxFileSize:          1024
      methodType:           'POST'
      paramName:            "image"
      replaceFileInput:     false
      sequentialUploads:    true    
      
      extensionErrorTemplate: "admin/templates/upload/extension_error"
      imageFinalTemplate:     "admin/templates/upload/image_final"
      imagePreviewTemplate:   "admin/templates/upload/image_preview"  
      sizeErrorTemplate:      "admin/templates/upload/size_error"
          
    { @dropzone, @errorContainer, @imageContainer, @uploadContainer, @uploadForm, @uploadInput, @url } = options
    { @allowedTypes, @dataType, @maxFileSize, @methodType, @paramName, @replaceFileInput, @sequentialUploads } = options
    { @extensionErrorTemplate, @imageFinalTemplate, @imagePreviewTemplate, @sizeErrorTemplate } = options
    
    @setupBindings()
    @setupUpload()
  
  setupBindings: ->
    @uploadContainer.on 'click', (e) =>
      e.preventDefault()
      @uploadInput.click()
    
    @uploadContainer.on 'drop dragover', (e) =>
      e.preventDefault()
      
    that = @
    
    $(document).on 'click', '[data-toggle="delete-gallery-image"]', (e) ->
      e.preventDefault()      
      that.removeImage $(@)

  setupUpload: ->
    @uploadForm.fileupload
      dataType:           @dataType
      dropZone:           @dropzone
      paramName:          @paramName
      replaceFileInput:   @replaceFileInput
      sequentialUploads:  @sequentialUploads
      type:               @methodType
      
      add: (e, data)      => @addImage e, data
      done: (e, data)     => @uploadSuccess e, data
      fail: (e, data)     => @uploadError e, data
      
  addImage: (e, data) ->    
    return false unless data.files and data.files[0]
    return false unless @validUpload data
    
    template = @getImagePreviewTemplate()
    
    reader = new FileReader()
    reader.onload = (e) ->
      template.find('img').attr 'src', e.target.result
    reader.readAsDataURL data.files[0]
    
    data.context = template.appendTo(@imageContainer)
    
    template.find('.btn-cancel').on 'click', (e) ->
      e.preventDefault()
      jqXHR.abort()
      template.fadeOut(300, -> template.remove())
    
    jqXHR = data.submit()
  
  getImagePreviewTemplate: (data = {}) ->
    $(JST[@imagePreviewTemplate](data))
  
  getImageFinalTemplate: (data = {}) ->
    $(JST[@imageFinalTemplate](data))

  uploadError: (e, data) ->
    data.context.addClass 'error'
  
  uploadSuccess: (e, data) ->
    data.context.addClass 'success'
    data.context.find('.gallery-image').removeClass 'csspinner traditional'
        
    template = @getImageFinalTemplate data.result    
    
    $(data.context).replaceWith template
  
  validUpload: (data) ->
    return false unless @validateExtension data.files[0].name
    return false unless @validateSize data.files[0].name, data.files[0].size
    
    true
  
  validateExtension: (name) ->
    extension = name.substr(name.lastIndexOf('.') + 1)
    
    if $.inArray(extension, @allowedTypes) is -1 
      @addErrorMessage "extension", name
      return false
    else
      return true  
  
  validateSize: (name, size) ->
    if size < (@maxFileSize * 1000) 
      return true
    else
      @addErrorMessage "size", name
      return false
  
  addErrorMessage: (type, name) ->
    template = ''
  
    if type == 'extension'
      template = JST[@extensionErrorTemplate]
        name: name
      
    if type == 'size'
      template = JST[@sizeErrorTemplate]
        name: name
    
    @errorContainer.append template  
  
  removeImage: (button) ->
    url = button.data 'url'
    container = $(button.data('container'))
    
    @startLoading container
    
    $.ajax(
      url: url
      method: "DELETE"
      dataType: 'json'
    )
    .done( (data) => @removeImageSuccess(data, container) )
    .fail( (xhr, status, error) => @removeImageError(xhr, status, error, container) )
  
  startLoading: (el) ->
    el.addClass 'csspinner traditional'
  
  stopLoading: (el) ->
    el.removeClass 'csspinner traditional'
  
  removeImageSuccess: (data, el) ->
    el.fadeOut()
  
  removeImageError: (xhr, status, error, el) ->
    @stopLoading el

unless root.UploaderApp
  root.UploaderApp = new UploaderApp