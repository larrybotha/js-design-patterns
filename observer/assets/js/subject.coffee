class Subject
	# instantiate Subject with an ObserverList
	constructor: () ->
		@observers = new ObserverList()

	# allow Subject to add observers
	addObserver: (observer) ->
		@observers.add(observer)

	# allow Subject to remove observers
	removeObserver: (observer) ->
		@observers.removeAt(@observers.indexOf(observer))

	# notify all observers in the list
	notify: (context) ->
		for i in @observers
			@observers.get(i).update(context)

		return
