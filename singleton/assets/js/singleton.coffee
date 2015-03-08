Singleton = do () ->
	# instance is undefined until Singleton is instantiated
	instance = undefined

	# initialise the singleton
	#
	# behaves just like Module Pattern inside here
	init = (opts) ->
		# private instance members
		name = opts.name || 'Singleton'

		myPrivateMethod = () ->
			console.log "private function called"

		# public instance members
		return {
			name: name
			myPublicMethod: myPrivateMethod
		}

	# returned when first instantiated
	#
	# define static properties here
	return {
		name: 'Singleton'
		getInstance: (opts) ->
			# assign instance to init() if there is no instance, then return it
			instance = init(opts) unless instance

			instance
	}
