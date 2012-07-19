(function() {
  window.SpinalWiki = {
    Models: {},
    Collections: {},
    Routers: {},
    Views: {},
    init: function() {
      router = new SpinalWiki.Routers.Router
      Backbone.history.start({pushState:true})
    }
  };

  $(document).ready(function() {
    SpinalWiki.init()
  });
}).call(this);