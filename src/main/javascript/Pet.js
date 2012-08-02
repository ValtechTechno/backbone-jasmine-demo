var Pet = Backbone.Model.extend({});

var Pets = Backbone.Collection.extend({
	model: Pet
});

var PetsView = Backbone.View.extend({
	el:'#pets',
	initialize: function(collection) {
		this.col = collection;
		this.tpl = _.template($("#pet-template").html());
		this.render();
		this.col.on("all",this.render,this);
	},
	render: function() {
		var renderedList = this.col.map(function(k) {
			return this.tpl({"m":k});
		}, this).join("")
		this.$el.html(renderedList);
	},
	events: {
		"click li": "select"
	},
	select: function(e) {
		var li = $(e.target),
		cid = li.data('cid');

		this.col.each(function(o) {
			if (o.cid == cid) {
				if (!o.has('selected')) {
					o.set({'selected': 'selected'});
					return;
				}
			}
			o.unset('selected');
		});
	}
});
