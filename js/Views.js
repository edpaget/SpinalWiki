(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  SpinalWiki.Views.AppView = (function(_super) {

    __extends(AppView, _super);

    function AppView() {
      AppView.__super__.constructor.apply(this, arguments);
    }

    return AppView;

  })(Backbone.View);

  SpinalWiki.Views.Page = (function(_super) {

    __extends(Page, _super);

    function Page() {
      Page.__super__.constructor.apply(this, arguments);
    }

    return Page;

  })(Backbone.View);

}).call(this);
