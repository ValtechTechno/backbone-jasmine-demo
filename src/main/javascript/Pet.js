var Pet = Backbone.Model.extend({});

var Pets = Backbone.Collection.extend({
	model: Pet
});

var PetsView = Backbone.View.extend({
	el:'#pets',
	initialize: function(collection) {
		this.col = collection;
	}
});
