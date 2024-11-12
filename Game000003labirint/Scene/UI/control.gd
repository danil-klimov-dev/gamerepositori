extends Control

var seconds
var minutes
var secondsText
var minutesText

# Called when the node enters the scene tree for the first time.
func _ready():
	seconds = 0
	minutes = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_timer_one_second_timeout():
	seconds += 1
	if (seconds == 60):
		seconds = 0
		minutes += 1
	if (seconds < 10):
		secondsText = "0" + str(seconds)
	else:
		secondsText = seconds
	if (minutes < 10):
		minutesText = "0" + str(minutes)
	else:
		minutesText = minutes
	$"/root/GameStats".timer = str(minutesText) + ":" + str(secondsText)
	$lblTimer.text = "Время: " + str(minutesText) + ":" + str(secondsText)


