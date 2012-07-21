(function() {
  window.SpinalWiki = {
    Models: {},
    Collections: {},
    Routers: {},
    Views: {},
    init: function() {
      wiki = new SpinalWiki.Collections.Wiki()
      appView = new SpinalWiki.Views.AppView({collection: wiki, el: "#main"})
      router = new SpinalWiki.Routers.Router({appView: appView})
      Backbone.history.start()
    }
  };

  $(document).ready(function() {
    SpinalWiki.init()
  });
}).call(this);