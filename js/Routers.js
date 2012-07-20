(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  SpinalWiki.Routers.Router = (function(_super) {

    __extends(Router, _super);

    function Router() {
      Router.__super__.constructor.apply(this, arguments);
    }

    Router.prototype.routes = {
      "page/:id": "page",
      "/": "index"
    };

    Router.prototype.initialize = function(options) {
      return this.appView = options.appView;
    };

    Router.prototype.index = function() {
      return window.location.hash = "#page/0";
    };

    Router.prototype.page = function(id) {
      if (this.appView.page) this.appView.removePage;
      return this.appView.showPage(id);
    };

    return Router;

  })(Backbone.Router);

}).call(this);