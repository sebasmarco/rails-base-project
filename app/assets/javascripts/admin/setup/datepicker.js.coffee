root = exports ? this

class DatePickerSetup
  init: ->    
    @setNormalDatepicker()
    @setDualDatepicker()
  
  setNormalDatepicker: ->
    $(".datepicker").datepicker
      autoclose: true 
      todayHighlight: true
      weekStart: 1
      format: "dd-mm-yyyy"
  
  setDualDatepicker: ->
    @currentDate = @getCurrentDate()
  
    @datepicker1 = $(".datepicker-1").datepicker(
      autoclose: true 
      weekStart: 1
      format: "dd-mm-yyyy"
      onRender: (date) =>      
        (if date.valueOf() < @currentDate.valueOf() then "disabled" else "")
    )
    .on("changeDate", (e) =>
      if e.date.valueOf() > @datepicker2.date.valueOf()
        newDate = new Date(e.date)
        newDate.setDate(newDate.getDate() + 1)
        @datepicker2.setValue newDate
            
      @datepicker1.hide()
      $(".datepicker-2").focus()
    )
    .data('datepicker')
    
    @datepicker2 = $(".datepicker-2").datepicker(
      autoclose: true 
      weekStart: 1
      format: "dd-mm-yyyy"
      onRender: (date) =>
        (if date.valueOf() <= @datepicker1.date.valueOf() then "disabled" else "")
    )
    .on("changeDate", (e) =>
      @datepicker2.hide()
    )
    .data('datepicker')
  
  getCurrentDate: ->
    nowTemp = new Date()
    now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0,0,0,0)
    now

unless root.DatePickerSetup
  root.DatePickerSetup = new DatePickerSetup