do (window, document) ->
	window.onload = () ->
		# extend the inherited properties from outside of the class
		Calculator.prototype.add = (x, y) ->
			# we don't have access to private members here
			@elem.innerHTML += x * y

		calc = new Calculator('.eq')
		calc.add(2, 3)

	# our object constructor
	Calculator = (elem) ->
		@elem = document.querySelector(elem)

		# this return required so that we don't return the above element as the newly
		# created object
		return

	# our class's prototype
	#
	# self invoking so that it will return an object exposing our public methods
	Calculator.prototype = do () ->
		# our private members reside here

		# without being publicly exposed, this method has no direct access to the
		# instance - the instance must be passed through to it for any manipulation
		_output = (val) ->
			@elem.innerHTML += val

		add = (x, y) ->
			_output.call(@, x + y)

		subtract = (x, y) ->
			_output.call(@, x - y)

		# publicly expose the members we want exposed here
		return {
			add: add
			subtract: subtract
		}
