root = exports ? this

class DashboardChartDataApp
  init: (options = {}) ->
    _.defaults options,
      startDate:      $('#dashboard-start-date')
      endDate:        $('#dashboard-end-date')
      url:            "/"
      
      graphContainer: $('#dashboard-chart')
      panel1:         $('#panel-1')
      panel2:         $('#panel-2')
      panel3:         $('#panel-3')
      panel4:         $('#panel-4')
    
    { @startDate, @endDate, @url } = options
    { @graphContainer, @panel1, @panel2, @panel3, @panel4 } = options
    
    @graphObject      = dashboardGraph 
    
    @setupBindings()
    @updateData()
  
  setupBindings: ->
    @startDate.on 'change', (e) =>
      @updateChartData()
    
    @endDate.on 'change', (e) =>
      @updateChartData()

  updateChartData: ->      
    if @dateNotEmpty()
      @updateData()
        
  dateNotEmpty: ->
    if @startDate.val() is "" or @endDate.val() is "" then false else true 

  startLoading: ->    
    @disable @startDate
    @disable @endDate
    
    @panel1.text ''
    @panel2.text ''
    @panel3.text ''
    
    @graphContainer.addClass 'csspinner traditional'
    @panel1.addClass 'csspinner white xs no-overlay traditional'
    @panel2.addClass 'csspinner white xs no-overlay traditional'
    @panel3.addClass 'csspinner white xs no-overlay traditional'
    @panel4.addClass 'csspinner white xs no-overlay traditional'
  
  stopLoading: ->    
    @enable @startDate
    @enable @endDate
    
    @graphContainer.removeClass 'csspinner traditional'
    @panel1.removeClass 'csspinner white xs no-overlay traditional'
    @panel2.removeClass 'csspinner white xs no-overlay traditional'
    @panel3.removeClass 'csspinner white xs no-overlay traditional'
    @panel4.removeClass 'csspinner white xs no-overlay traditional'
  
  disable: (el) ->
    el.addClass 'disabled'
    el.attr 'disabled', 'disabled'
    
  enable: (el) ->
    el.removeClass 'disabled'
    el.removeAttr 'disabled', 'disabled'
  
  getData: ->  
    data = 
      "start_date": @startDate.val()
      "end_date":   @endDate.val()
    data
  
  updateData: ->
    @startLoading()  
    
    $.ajax(
      url:  @url
      data: @getData()
    )
    .done( (data) => @updateSuccess(data) )
    .fail( (xhr, status, error) => @updateError(xhr, status, error) )  

  updateItems: (data) ->  
    @graphObject.setData data.chart_data
    
    @panel1.text data.panel_1
    @panel2.text data.panel_2
    @panel3.text data.panel_3
    @panel4.text data.panel_4
   
  updateSuccess: (data) ->
    @updateItems data	
    @stopLoading()
  
  updateError: (xhr, status, error) ->
    @stopLoading()
       
unless root.DashboardChartDataApp
  root.DashboardChartDataApp = new DashboardChartDataApp