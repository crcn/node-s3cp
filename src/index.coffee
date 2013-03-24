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

  sync: (options, callback) -> 
    new Sync(@, options).start callback

    


module.exports = (options) -> new S3CP options



