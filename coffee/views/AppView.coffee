class SpinalWiki.Views.AppView extends Backbone.View
  initialize: ->
    @collection.fetch() if @collection

  showPage: (pageTitle) ->
    pageModel = @collection.find (page) ->
      page.get('title') == pageTitle
    if !pageModel
      edit = true
      pageModel = new SpinalWiki.Models.Page { title: pageTitle, body: "Your Test Here", parsedBody: "<p>Your Test Here</p>" }
      @collection.add pageModel
    @page = new SpinalWiki.Views.Page {model: pageModel}
    @$el.append(@page.render().el)
    @page.edit() if edit

  removePage: ->
    @page.unbind()
    @page.remove()
    @page = null