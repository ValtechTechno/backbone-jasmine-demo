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
		var li = $(e.target);
		li.toggleClass('selected');
	}
});
