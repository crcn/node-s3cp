knox       = require "knox"
Sync       = require "./sync"
async      = require "async"
toarray    = require "toarray"

class S3CP

  ###
  ###

  constructor: (@options) ->
    @_s3 = knox.createClient options



  ###
  ###

  download: (options, callback) -> 
    @_run "download", options, callback


  ###
  ###

  redownload: (options, callback) -> 
    @_run "redownload", options, callback


  ###
  ###

  upload: (options, callback) -> 
    @_run "upload", options, callback


  ###
  ###

  _run: (command, options, callback) ->
    async.eachSeries toarray(options), ((option, next) =>
      sync = new Sync(@, option)
      sync.start () ->
        sync[command].call(sync, next)
    ), callback

    


module.exports = (options) -> new S3CP options



