class SpinalWiki.Views.AppView extends Backbone.View
  initialize: ->
    @collection.fetch() if @collection

  showPage: (pageId) ->
    pageModel = @collection.get pageId
    if !pageModel
      edit = true
      pageModel = new SpinalWiki.Models.Page { id: pageId, title: "New Page", body: "Your Test Here", parsedBody: "<p>Your Test Here</p>" }
      @collection.add pageModel
    @page = new SpinalWiki.Views.Page {model: pageModel}
    @$el.append(@page.render().el)
    @page.edit() if edit

  removePage: ->
    @page.unbind()
    @page.remove()
    @page = null