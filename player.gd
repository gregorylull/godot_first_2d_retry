extends Area2D

signal damaged

const SPEED = 400 # px/sec
const HEALTH = 3 # hp

var health: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = HEALTH
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	
	# process inputs
	if Input.is_action_pressed("move_left"):
		velocity.x = SPEED * delta * -1
	
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED * delta
	
	if Input.is_action_pressed("move_up"):
		velocity.y = SPEED * delta * -1
	
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED * delta
	
	position += velocity


# when a Body2D enters my collision, in this case my enemy will be a body (not an area)
func _on_body_entered(body: Node2D) -> void:
	damaged.emit()
	print("body entered:", body.name)
	
	# simple would be all enemies -1
	health -= 1
	
	# TODO: use enemy types to damage, e.g. -1 vs -2 if enemy is red
	
	
	
