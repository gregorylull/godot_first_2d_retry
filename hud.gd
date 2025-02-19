extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_score(score = 0):
	$Score.text = str(score)

func get_score():
	return int($Score.text)

func _on_start_button_pressed() -> void:
	start_game.emit()
	
	set_score(0)
	
	$StartButton.hide()
	$Message.text = "Get ready!"
	
	await get_tree().create_timer(0.5).timeout
	
	$Message.hide()
	$HP.text = "HP: " + str(3)


func get_retry_message(score = 0):
	var msg = "Hmm"
	
	if score == 0:
		msg = "not the best..."
	elif score < 10:
		msg = "not bad"
		
	elif score < 20:
		msg = "valiant!"
		
	elif score < 30:
		msg = "wow..."
		
	elif score < 40:
		msg = "most impressive"
	else:
		msg = "spend your time wisely elsewhere"
	
	return msg
			

func _on_player_player_dead() -> void:
	$Message.text = get_retry_message(get_score())
	$Message.show()
	$StartButton.text = "Try again"
	$StartButton.show()


func _on_player_damaged(hp) -> void:
	$HP.text = "HP: " + str(hp)
