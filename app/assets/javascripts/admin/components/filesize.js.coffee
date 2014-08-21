root = exports ? this

class FileSize
  format: (bytes) ->
    return '' if typeof bytes isnt 'number'    
    return "#{(bytes / 1000000000).toFixed(2)} GB" if bytes >= 1000000000
    return "#{(bytes / 1000000).toFixed(2)} MB" if bytes >= 1000000
    return "#{(bytes / 1000).toFixed(2)} KB"    

unless root.FileSize
  root.FileSize = new FileSize