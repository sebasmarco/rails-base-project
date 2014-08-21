root = exports ? this

class Select2Setup
  init: ->        
    $('.select').select2()

unless root.Select2Setup
  root.Select2Setup = new Select2Setup