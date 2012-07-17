class SpinalWiki.Views.Page extends Backbone.View

  template: _.template($('#page_template').html())

  events:
    "dbclick .article" : "edit"
    "blur .edit"       : "close"
    "click a.destory"  : "clear" 
    "click a.done"     : "close"

  initialize:
    @model.bind('change', this.render, this)
    @model.bind('destory', this.remove, this)

  render:
    @$el.html(@template(@model.toJSON))
    @input = this.$('.edit')
