extends Area2D

signal damaged
signal player_dead

@onready var aSprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 400 # px/sec
const HEALTH = 3 # hp

var health: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func set_health(h = 0):
	health = h

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	
	# process inputs
	if Input.is_action_pressed("move_left"):
		velocity.x = SPEED * delta * -1
		aSprite.play("walk")
		aSprite.flip_h = true
	
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED * delta
		aSprite.play("walk")
		aSprite.flip_h = false
	
	if Input.is_action_pressed("move_up"):
		velocity.y = SPEED * delta * -1
		aSprite.play("up")
		aSprite.flip_v = false
	
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED * delta
		aSprite.play("up")
		aSprite.flip_v = true
		
	
	position += velocity

# when a Body2D enters my collision, in this case my enemy will be a body (not an area)
func _on_body_entered(body: Node2D) -> void:
	# simple would be all enemies -1
	health -= 1
	damaged.emit(health)
	
	print("current health: ", health, health == 0)
	
	if health == 0:
		print("i am dead")
		player_dead.emit()
	
	# TODO: use enemy types to damage, e.g. -1 vs -2 if enemy is red
	
	
	
