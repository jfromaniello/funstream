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

    if @current == @to
      @emit 'end'

  resume: ->
    @paused = false
    @_run()

  pause: ->
    @paused = true

module.exports = RangeStream