(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  SpinalWiki.Models.Page = (function(_super) {

    __extends(Page, _super);

    function Page() {
      Page.__super__.constructor.apply(this, arguments);
    }

    Page.prototype.clear = function() {
      return this.destroy();
    };

    return Page;

  })(Backbone.Model);

}).call(this);
