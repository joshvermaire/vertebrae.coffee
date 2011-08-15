# Vertebrae.coffee
## Strengthening your backbone.

General plugins for backbone.js
http://github.com/documentcloud/backbone

## Get 
Absolutely no setup to get attributes across multiple related models and collections. Use as many or as few arguments as you would like.

Want to find a model's related collection or an attribute from that collection? Just assign arguments to the `get` method that explan where to look. 

Example:

Set up your models and collections as normal.

	Note = Backbone.Model.extend();
	Notes = Backbone.Collection.extend({model: Note});

	Owner = Backbone.Model.extend();
	Owners = Backbone.Collection.extend({model: Owner});

	Company = Backbone.Model.extend();
	Companies = Backbone.Collection.extend({model: Company});

Create your collections with models

	owners = new Owners({
		id: 42
		name: "Bob from Accounting"
		company_id: 64
	})

	notes = new Notes({
		id: 1
		text: "Please submit your TPS reports"
		owner_id: 42
	})

	companies = new Companies({
		id: 64
		name: "Initech"

	})

Make your call

	company_name = notes.get(1, 'owner_id', owners, 'company_id', companies, 'name')

`company_name` returns `"Initech"`

We'll let you follow it through.

Originally based on ligament.js
https://github.com/dbrady/ligament.js