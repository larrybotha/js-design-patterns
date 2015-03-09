extend = (extension, obj) ->
	# for i of item => for (i in item) {} ... wtf
	for key of extension
		obj[key] = extension[key]

	return

# ConcreteObserver
#
# implements the Observer update interface to ensure state is consistent with
# Observer's
addNewObserver = () ->
	# create a new checkbox
	check = document.createElement("input")
	check.type = 'checkbox'

	# extend the new input with the interface created by the Observer
	extend(new Observer(), check)

	# override Observer.prototype.update
	#
	# when the ConcreteSubject gets notified of a change in state, it
	# iterates over every observer in its list, executing observer#update
	# for each
	check.update = (val) ->
		@checked = val
		return

	# add the new observer through the ConcreteSubject
	controlCheckbox.addObserver(check)

	# add the new observer to the DOM
	container.appendChild(check)

	return


# Dom elements
controlCheckbox = document.querySelector('.checkbox-main')
btnControl = document.querySelector('.add-new-observer')
container = document.querySelector('.observers-container')

# ConcreteSubject
#
# this component's job is to broadcast notifications to observers

# first we extend an element with the Subject class
# this is the actual creation of the SoncreteSubject
extend new Subject(), controlCheckbox

# when an event occurs on the ConcreteSubject, notify all of its observers
controlCheckbox.addEventListener 'click', () ->
	controlCheckbox.notify controlCheckbox.checked


# whenever we click the button, add a new observer
btnControl.addEventListener 'click', addNewObserver

