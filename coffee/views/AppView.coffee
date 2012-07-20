class SpinalWiki.Views.AppView extends Backbone.View
  showPage: (pageId) ->
    @page = new SpinalWiki.Views.Page {model: @collection.get(pageId)}
    @$el.append(@page.render().el)

  removePage: ->
    @page.unbind()
    @page.remove()
    @page = null