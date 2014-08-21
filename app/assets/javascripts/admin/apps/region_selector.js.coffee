do ($) ->
  $.fn.extend
    regionSelect: (options) ->
      self = $.fn.regionSelect
      opts = $.extend {}, self.default_options, options
      
      $(this).each (i, el) ->
        self.init el, opts
  
  $.extend $.fn.regionSelect,
    default_options:
      region:     $('#regions')
      commune:    $('#communes')
      commune_id: 0
    
    init: (el, options) ->
      @el             = $(el)      
      @setupBindings options.commune
      
      @setRegionAndCommune options
  
    setupBindings: (commune) -> 
      @el.on 'change', (e) =>      
        id = $(e.target).val()
        @updateCommunesList commune, id
    
    setRegionAndCommune: (options) ->
      region = options.region
      
      if region.val() > 0
        @updateCommunesList(options.commune, region.val()) 
        @setCommune(options.commune, options.commune_id)
    
    setCommune: (el, id) ->
      el.select2 'val', id
      $("#{el.selector} option[value=#{id}]").attr 'selected', 'selected'
    
    updateCommunesList: (communeSelect, id)->        
      communes = _.where(gon.communes, { region_id: parseInt(id) })
      
      html = "<option selected disabled></option>"
      
      for commune in communes
          html += "<option value='#{commune.id}'>#{commune.name}</option>"
                
      communeSelect.html html
      communeSelect.select2 'destroy'
      communeSelect.select2
        width: '100%'
        allowClear: false