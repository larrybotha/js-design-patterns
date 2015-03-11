# create an empty pubsub object
pubsub = {}

# pubsub is passed through to the siaf by reference -> pubsub will gain all
# properties added to myObj
do (myObj = pubsub) ->
	# we need an object to keep track of all the topics that are published and
	# subscribed to
	topics = {}

	# a unique identifier so we can keep track of topics
	subUid = -1

	# publish or broadcast a topic that can be subscribed to
	#
	# a topic with a name is passed through, along with arguments to pass through
	# to each subscriber's callback
	myObj.publish = (topic, args) ->
		# if the topic published does not exist in our topics array, exit
		if !topics[topic]
			return false

		# get the subscribers for the current topic
		#
		# these subscribers are pushed onto any specific topic when they subscribe
		subscribers = topics[topic]

		# if there are no subscribers, set the length to 0
		len = if subscribers then subscribers.length else 0

		# loop over each subscriber, passing the topic, and arguments through to it
		while len--
			subscribers[len].func(topic, args)

		# return 'this' so that the method may be chained
		@

	# allow objects to subscribe to a topic, and execute a callback when the topic
	# is published
	myObj.subscribe = (topic, func) ->
		# if the topic doesn't exist, create an empty array for that topic where
		# subscribers can be pushed onto
		if !topics[topic]
			topics[topic] = []

		# create a token for this subscriber by incrementing the unique identifier
		token = (++subUid).toString()

		# push the token and callback onto this topic for this subscriber
		topics[topic].push({
			token: token
			func: func
		})

		# return the token for this subscriber that we can unsubscribe it at a later
		# point in time
		token

	# allow a subscriber to unsubscribe by passing pubsub the token for that
	# subscriber
	myObj.unsubscribe = (token) ->
		# loop through each topic in our topics object
		for t of topics

			# check if the current topic actually exists
			if topics[t]
				i = 0
				j = topics[t].length

				# while we haven't looped through the total number of subscribers for
				# the current topic...
				while i < j
					# does the current token match this subscriber's token?
					if topics[t][i].token == token
						# then remove this subscriber from this topic
						topics[t].splice i, 1
						return token

		@


