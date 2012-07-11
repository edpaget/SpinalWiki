class SpinalWiki.Collections.Wiki extends Backbone.Collection
  
  model: SpinalWiki.Models.Page

  localStorage: new Store 'SpinalWiki'

  category: (name) ->
    this.filter (page) ->
      page.get('category') == name