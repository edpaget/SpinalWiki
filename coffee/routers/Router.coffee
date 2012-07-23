class SpinalWiki.Routers.Router extends Backbone.Router

  routes:
    "page/:id"   : "page"
    ""          : "index"

  initialize: (options) ->
    @appView = options.appView

  index: ->
    window.location.hash = "#page/Main"

  page: (title) ->
    @appView.removePage() if @appView.page 
    @appView.showPage title
