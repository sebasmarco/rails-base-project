root = exports ? this

class SummernoteSetup
  init: ->        
    $(".summernote").summernote
      height: 180
      toolbar: [
        ['style', ['fontsize', 'bold', 'italic', 'underline', 'clear']]
        ['para', ['ul', 'ol', 'paragraph', 'height']],
        ['insert', ['link', 'table']],
        ['misc', ['codeview', 'undo', 'redo']]
      ]
    
    $(".summernote-xl").summernote
      height: 800
      toolbar: [
        ['style', ['fontsize', 'bold', 'italic', 'underline', 'clear']]
        ['para', ['ul', 'ol', 'paragraph', 'height']],
        ['insert', ['link', 'table']],
        ['misc', ['codeview', 'undo', 'redo']]
      ]

unless root.SummernoteSetup
  root.SummernoteSetup = new SummernoteSetup