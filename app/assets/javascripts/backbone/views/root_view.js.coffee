class APP.Views.RootView extends Backbone.View
  FLOWER_DELAY: 2000

  render: ->
    @show("loading")
    @fetchCurrentSprint()
    @

  fetchCurrentSprint: ->
    @model.fetch
      success: => _.delay(@show, @FLOWER_DELAY, "root", sprint: @model)
      error: => _.delay(@show, @FLOWER_DELAY, "dang")

  show: (view, context = {}) =>
    $(@el).html(JST["backbone/templates/#{view}"](context))

    drop = @$(".drop")

    bounceIt = ->
      drop.addClass("bounce")

    if drop.length
      drop.addClass("dropped")
      _.delay(bounceIt, 300)


