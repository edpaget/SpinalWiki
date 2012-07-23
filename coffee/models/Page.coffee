class SpinalWiki.Models.Page extends Backbone.Model
  initialize: ->
    this.set "title", this.get('title').replace(/%20/g, " ")
    this.set "parsedBody", marked(this.get("body"))
    this.on "change", this.markdown, this

  clear: ->
    this.destroy()

  markdown: ->
    if this.hasChanged "body"
      this.set "parsedBody", marked(this.get("body"))