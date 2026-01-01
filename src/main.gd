extends Node2D
var miles: = 0
var time_taken: = 0
@onready var number: Label = $walked/number
@onready var time_number: Label = $time_text/time_number


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	read_files("Miles")
	read_files("Time")
	set_numbers_UI()

func read_files(type):
	var file_miles = FileAccess.open("user://miles.dat", FileAccess.READ)
	var file_time = FileAccess.open("user://time.dat", FileAccess.READ)
	if file_miles == null and file_time == null:
		saveeee()
	else:
		if type == "Miles":
			var miless = file_miles.get_as_text()
			miles = int(miless)
		else:
			if type == "Time":
				var timezz = file_time.get_as_text()
				time_taken = int(timezz)

func saveeee():
	var SAVE_miles = FileAccess.open("user://miles.dat", FileAccess.WRITE)
	var SAVE_time = FileAccess.open("user://time.dat", FileAccess.WRITE)
	var content_miles: = str(miles)
	var content_time: = str(time_taken)
	
	SAVE_miles.store_string(content_miles)
	SAVE_time.store_string(content_time)

func set_numbers_UI():
	number.text = str(miles)
	time_number.text = str(time_taken)

func _on_add_pressed() -> void:
	miles += 1
	time_taken += 20
	saveeee()
	set_numbers_UI()

func _on_remove_pressed() -> void:
	miles -= 1
	time_taken -= 20
	saveeee()
	set_numbers_UI()
