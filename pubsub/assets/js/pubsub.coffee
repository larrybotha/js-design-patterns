pubsub = {}

do (myObj = pubsub) ->
	topics = {}

	subUid = -1

	myObj.publish = (topic, args) ->
		if !topics[topic]
			false

		subscribers = topics[topic]
		len = if subscribers then subscribers.length else 0

		while len--
			subscribers[len].func(topic, args)

		@

	myObj.subscribe = (topic, func) ->
		if !topics[topic]
			topics[topic] = []

		token = (++subUid).toString()

		topics[topic].push({
			token: token
			func: func
		})

		token

	myObj.unsubscribe = (token) ->
		for m of topics
			if topics[m]
				i = 0
				j = topics[m].length
				while i < j
					if topics[m][i].token == token
						topics[m].splice i, 1
						return token

		@


