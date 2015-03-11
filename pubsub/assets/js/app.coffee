# a callback for our subscriber
messageLogger = (topic, data) ->
	console.log "Logging: #{topic}: #{data}"

# create a subscriber
#
# the subscriber will be assigned the value of its token that it
# may be used passed to pubusb for unsubscribing later
subscription = pubsub.subscribe 'inbox/newMessage', messageLogger

# publish a few topics
#
# data here is passed to the callback
pubsub.publish 'inbox/newMessage', "hello world"
pubsub.publish 'inbox/newMessage', ["test", "a", "b", "c"]
pubsub.publish 'inbox/newMessage', sender: "hello@google.com", body: "hey again"

# unsubscribe our subscription
pubsub.unsubscribe subscription

# with no subscription to respond to published topics, this will not execute
# any callbacks
pubsub.publish 'inbox/newMessage', "hello, are you still there?"
