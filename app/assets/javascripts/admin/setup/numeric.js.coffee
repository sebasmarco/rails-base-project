root = exports ? this

class NumericSetup
  init: ->       
    options = 
      decimal: ","
      negative: false
    
   
    $('.input-decimal').numeric options
    $('.input-number').numeric options
    
    # No permitir que ingrese un punto (.)
    $('.input-decimal').on 'keypress', (e) ->
      key = (if e.charCode then e.charCode else (if e.keyCode then e.keyCode else 0))
      e.preventDefault() if key == 190 || key == 110 || key == 46
    
    # Modifica numeros con punto a comma
    if $('.input-decimal').length > 0
      $('.input-decimal').each ->
        console.log "SOME"
        number = $(this).val()
        number = number.replace('.', ',')
        $(this).val number
    
    # No permitir numeros decimales
    $('.input-number').on 'keypress', (e) ->
      console.log "KEY"
    
      key = (if e.charCode then e.charCode else (if e.keyCode then e.keyCode else 0))
      
      console.log "KEY", key
      
      e.preventDefault() if key is 190 || key is 110 || key is 188 || key is 44 || key is 46

unless root.NumericSetup
  root.NumericSetup = new NumericSetup