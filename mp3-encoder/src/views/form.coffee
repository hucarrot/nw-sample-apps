class EncodeFormView extends Backbone.View
  tagName: "form"
  events:
    "submit" : "onSubmit"

  initialize: ({@logsElem}) ->

  render: ->
    @$el.html """
      File: <input class="file" type="file"><br>
      Bitrate: <input class="bitrate" type="text" value="128"><br>
      <input type="submit" value="Encode!">
    """

    this

  onSubmit: (e) ->
    e.preventDefault()

    data =
      source:  @$("input.file").val()
      bitrate: parseInt @$("input.bitrate").val()
      log: (data) =>
        @logsElem.html "#{@logsElem.html()}<br>#{data}"

    return console.log "no file!" unless data.source?

    (new Encoder data).process()
