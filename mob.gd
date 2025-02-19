extends RigidBody2D

@onready var aSprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Mob _ready()")
	
	var mobTypes = aSprite.sprite_frames.get_animation_names()
	var mobFrame = mobTypes[randi_range(0, mobTypes.size() - 1)]
	aSprite.play(mobFrame)
	
	if mobFrame == "fly":
		linear_velocity = Vector2(225, 0)
	
	elif mobFrame == "walk":
		linear_velocity = Vector2(175, 0)

	elif mobFrame == "swim":
		linear_velocity = Vector2(125, 0)

	
	print("\nspawning: ", mobFrame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
