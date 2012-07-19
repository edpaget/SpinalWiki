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

    Page.prototype.template = _.template($('#page_template').html());

    Page.prototype.events = {
      "dbclick .article": "edit",
      "blur .edit": "close"
    };

    Page.prototype.initialize = function() {
      if (this.model) this.model.bind('change', this.render, this);
      if (this.model) return this.model.bind('destory', this.remove, this);
    };

    Page.prototype.render = function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.input = this.$('.edit');
      return this;
    };

    Page.prototype.edit = function() {
      this.$el.addClass('editing');
      return this.input.focus();
    };

    Page.prototype.close = function() {
      var body;
      body = this.input.val();
      if (!body) this.clear();
      this.model.save({
        body: body
      });
      return this.$el.removeClass('editing');
    };

    Page.prototype.clear = function() {
      return this.model.destroy();
    };

    return Page;

  })(Backbone.View);

}).call(this);
