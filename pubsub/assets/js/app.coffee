messageLogger = (topics, data) ->
	console.log "Logging: #{topics}: #{data}"

subscription = pubsub.subscribe 'inbox/newMessage', messageLogger

pubsub.publish 'inbox/newMessage', "hello world"

pubsub.publish 'inbox/newMessage', ["test", "a", "b", "c"]

pubsub.publish 'inbox/newMessage', sender: "hello@google.com", body: "hey again"

pubsub.unsubscribe subscription

pubsub.publish 'inbox/newMessage', "hello, are you still there?"
