extend = (extension, obj) ->
	for key of extension
		obj[key] = extension[key]

	return

addNewObserver = () ->
	check = document.createElement("input")
	check.type = 'checkbox'

	extend(new Observer(), check)

	# check.update = (val) ->
	#   @checked = value
	#   return

	controlCheckbox.addObserver(check)

	container.appendChild(check)

	return

controlCheckbox = document.querySelector('.checkbox-main')
btnControl = document.querySelector('.add-new-observer')
container = document.querySelector('.observers-container')

extend new Subject(), controlCheckbox

controlCheckbox.addEventListener 'click', () ->
	controlCheckbox.notify controlCheckbox.checked

btnControl.addEventListener 'click', addNewObserver

