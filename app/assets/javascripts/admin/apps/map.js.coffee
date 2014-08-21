root = exports ? this

class MapApp
  init: (options = {}) ->
    _.defaults options,
      mapId:      "map"
      address:    $("input[name='address']")
      commune:    $("input[name='commune']")
    
    { @map, @mapId, @address, @commune } = options
        
    @setupBindings()
    @setupMap()
  
  setupBindings: ->
    @address.on 'blur', (e) =>
      @updateMarkerPositionBasedOnAddress(@getAddress()) if @canSetMarker()
    
    @commune.on 'change', (e) =>
      @updateMarkerPositionBasedOnAddress(@getAddress()) if @canSetMarker()
    
  setupMap: ->
    @updateLatitudeAndLongitude -33.416254,  -70.603563
    
    canvas = document.getElementById @mapId
    
    options =
      center:             new google.maps.LatLng(@latitude, @longitude)
      zoom:               16
      mapTypeId:          google.maps.MapTypeId.ROADMAP
      overviewMapControl: false
      panControl:         false
      rotateControl:      false
      scaleControl:       false
      streetViewControl:  false
      scrollwheel:        false
    
    @map      = new google.maps.Map(canvas, options)
    @geocoder = new google.maps.Geocoder()
  
  canSetMarker: ->
    console.log "COMMUNE VAL #{@commune.val()}"
    if @commune.val() != '' and @address.val() != '' then true else false
  
  updateLatitudeAndLongitude: (latitude, longitude) ->
    @latitude   = latitude
    @longitude  = longitude
  
  getLatitudeAndLongitude: ->
    data =
      latitude:   @latitude
      longitude:  @longitude
  
  getAddress: ->
    commune = if @commune.val()? then @commune.find(':selected').text() else ''
    address = "#{@address.val()} #{commune}, Chile"
  
  updateMarkerPosition: (latitude, longitude) ->
    @updateLatitudeAndLongitude latitude, longitude
    newLatLng = new google.maps.LatLng(latitude, longitude)
    
    if @marker?
      @marker.setPosition newLatLng
    else            
      @marker = new google.maps.Marker
        position: newLatLng
        map: @map
      
    @map.setCenter newLatLng
  
  updateMarkerPositionWithGeocoderResults: (results) ->
    latitude = results[0].geometry.location.lat()
    longitude = results[0].geometry.location.lng()
    
    @updateMarkerPosition latitude, longitude
  
  updateMarkerPositionBasedOnAddress: (address) -> 
    @geocoder = new google.maps.Geocoder() unless @geocoder?
       
    @geocoder.geocode
      address: address
    , (results, status) => @handleGeocoderResults results, status
  
  handleGeocoderResults: (results, status) ->
    if status is google.maps.GeocoderStatus.OK
      @ableToFetchAddress()
      @updateMarkerPositionWithGeocoderResults results
    else
      @unableToFetchAddress()
  
  ableToFetchAddress: ->
    #
  
  unableToFetchAddress: ->
    #

unless root.MapApp
  root.MapApp = new MapApp