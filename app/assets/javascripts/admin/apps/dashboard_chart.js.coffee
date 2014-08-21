root = exports ? this

class DashboardChartApp
  init: (options = {}) ->
    _.defaults options,
      element:      'dashboard-chart'
      initialData:  []
      
      labels:       ['Visits', 'Pledges']
      preUnits:     ""
      xkey:         'date'
      ykeys:        ['visits', 'pledges']
    
    { @element, @initialData } = options
    { @labels, @preUnits, @xkey, @ykeys } = options
    
    @setupChart()
  
  setupChart: ->
    root.dashboardGraph = new Morris.Area
      element:          @element
      data:             @initialData
      xkey:             @xkey
      ykeys:            @ykeys
      labels:           @labels
      
      lineColors:       ['#EFC25A', '#009FAF']
      gridTextColor:    '#95a5a6'
      gridLineColor:    '#95a5a6'
      gridLineWidth:    1
      gridTextFamily:   'Helvetica Neue, Helvetica, Arial, sans-serif'
      gridTextWeight:   'bold'
      gridTextSize:     13
      grid:             true
      fillOpacity:      0.0
      smooth:           false
      preUnits:         @preUnits
      resize:           true
      hideHover:        'auto'

unless root.DashboardChartApp
  root.DashboardChartApp = new DashboardChartApp