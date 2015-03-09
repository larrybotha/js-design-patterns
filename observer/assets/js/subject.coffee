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
		observerCount = @observers.count()
		i = 0

		# for every observer that has been added, get each instance, and
		# update it with the notification
		while i < observerCount
			@observers.get(i).update(context)
			i++

		return
