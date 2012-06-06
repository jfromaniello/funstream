stream = require('stream')

class RangeStream extends stream.Stream
  constructor: (@from, @to) ->
    @writable = false
    @current = @from
    @paused = false

  _run: ->
    until @current == @to or @paused
      @emit 'data', @current.toString()
      @current += if @current < @to then 1 else -1

  resume: ->
    @emit 'resume'
    @paused = false
    @_run()

  pause: ->
    @emit 'pause'
    @paused = true

module.exports = RangeStream