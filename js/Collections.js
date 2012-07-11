(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  SpinalWiki.Collections.Wiki = (function(_super) {

    __extends(Wiki, _super);

    function Wiki() {
      Wiki.__super__.constructor.apply(this, arguments);
    }

    Wiki.prototype.model = SpinalWiki.Models.Page;

    Wiki.prototype.localStorage = new Store('SpinalWiki');

    Wiki.prototype.category = function(name) {
      return this.filter(function(page) {
        return page.get('category') === name;
      });
    };

    return Wiki;

  })(Backbone.Collection);

}).call(this);
