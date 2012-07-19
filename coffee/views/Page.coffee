class SpinalWiki.Views.Page extends Backbone.View

  template: _.template($('#page_template').html())

  events:
    "dbclick .article" : "edit"
    "blur .edit"       : "close"

  initialize: ->
    @model.bind 'change', this.render, this if @model
    @model.bind 'destory', this.remove, this if @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    @input = this.$('.edit')
    return this

  edit: ->
    @$el.addClass 'editing'
    @input.focus()

  close: ->
    body = @input.val()
    unless body then this.clear()
    @model.save { body: body}
    @$el.removeClass 'editing' 

  clear: ->
    @model.destroy()
