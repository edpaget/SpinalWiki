class SpinalWiki.Views.Page extends Backbone.View

  template: _.template($('#page_template').html())

  events:
    "dbclick .page" : "edit"
    "blur .edit"    : "close"
    "click a.edit"  : "edit"
    "keypress .edit": "saveText"

  initialize: ->
    @model.bind 'change', this.updateText, this if @model
    @model.bind 'destory', this.remove, this if @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    @input = this.$('textarea.edit')
    return this

  edit: ->
    @$el.addClass 'editing'
    @input.val(@model.get('body'))
    @input.focus()

  close: ->
    body = @input.val()
    unless body then this.clear()
    @model.save { body: body }
    @$el.removeClass 'editing' 

  saveText: ->
    body = @input.val()
    @model.save { body: body }

  clear: ->
    @model.destroy()

  updateText: ->
    @$el.find('.page').html(@model.get('parsedBody'))
