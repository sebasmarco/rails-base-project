root = exports ? this

class FitVidsApp
  init: (options = {}) ->
    _.defaults options,
      target: $("#video")
          
    { target } = options
    
    target.fitVids()

unless root.FitVidsApp
  root.FitVidsApp = new FitVidsApp