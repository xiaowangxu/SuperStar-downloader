extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var savedir : String
var url : String
var from : int
var to : int
var current : int

func _on_Button_pressed():
	url = $LineEdit.text
	from = int($LineEdit2.text)
	to = int($LineEdit3.text)
	current = from
	$TextEdit.text = ""
	download()
	pass # Replace with function body.

func download() -> void:
	if (current <= to) :
		var true_url : String = url + str(current) + ".png"
		print("Downloading " + true_url)
		$TextEdit.text += "Downloading " + true_url + "\n"
		$TextEdit.cursor_set_column(INF)
		$HTTPRequest.download_file = savedir + "/" + $LineEdit4.text + str(current) + ".png"
		current += 1
		$HTTPRequest.request(true_url)
	else :
		$TextEdit.text += "Finished !\n"
		$TextEdit.cursor_set_column(INF)
	pass


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print("Downloaded !")
	$TextEdit.text += "Downloaded" + "\n"
	$TextEdit.text += "Remained " + str(to - current)
	$TextEdit.cursor_set_column(INF)
	download()
	pass # Replace with function body.


func _on_FileDialog_dir_selected(dir):
	savedir = dir
	pass # Replace with function body.


func _on_Button2_pressed():
	$FileDialog.popup_centered()
	pass # Replace with function body.
