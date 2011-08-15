# Setup
root = this

Vertebrae = (if (typeof exports != "undefined") then exports else @Vertebrae = {})

# Version
Vertebrae.VERSION = '0.1.0'

# Vertebrae Model
Vertebrae.Model =
	get: (first, second, others...) ->
		if not _.isEmpty(others)
			others.unshift(first)
			second.get others...
		else if second
			second
		else
			@attributes[first]

# Vertebrae Collection
Vertebrae.Collection =
	get: (first, second, others...) ->
		return null if first is null
		model = @_byId[(if first.id? then first.id else first)]
		if not _.isEmpty(others)
			(others.slice(0,1))[0].get(@get(first, second), (others.slice(1))...)
		else if second
			model.get second
		else
			model

# Override regular Backbone model and collection methods
$.extend(Backbone.Model.prototype, Vertebrae.Model)
$.extend(Backbone.Collection.prototype, Vertebrae.Collection)