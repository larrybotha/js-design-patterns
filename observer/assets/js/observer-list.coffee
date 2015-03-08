# create a class for the ObserverList
class ObserverList
	# instantiate ObserverList with an array
	constructor: () ->
		@observerList = []

	# add an object to the list
	add: (obj) ->
		@observerList.push(obj)

	# get the length of the list
	count: () ->
		@observerList.length

	# get the object at the specified index of the list
	get: (index) ->
		if index > -1 and index < @observerList.length
			@observerList[index]

	# get the index of an object if it is in the list
	indexOf: (obj, startIndex) ->
		i = startIndex || 0

		while i < @observerList.length
			if @observerList[i] == obj
				return i

			i++

	# remove the object at the specified index
	removeAt: (index) ->
		@observerList.splice(index, 1)
