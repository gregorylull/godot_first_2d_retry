extends Node

@export var Mob: PackedScene 

@onready var player: Area2D = $Player
@onready var mobPath: Path2D = $MobPath
@onready var mobPathFollow: PathFollow2D = $MobPath/MobPathFollow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("project settings: gui/theme/custom_font: ", ProjectSettings.get_setting("gui/theme/custom_font"))
	var viewport_dimensions = get_viewport().get_visible_rect()
	var size = viewport_dimensions.size
	
	player.position = size / 2 
	
	print("viewport vec: ", viewport_dimensions.size)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mob_timer_timeout() -> void:
	print('mob BEFORE instantiate')
	var mob: RigidBody2D = Mob.instantiate()
	print('mob AFTER instantiate')
	
	var progress_ratio = randf()
	
	mobPathFollow.progress_ratio = progress_ratio
	var direction = mobPathFollow.rotation + PI/2
	
	mob.position = mobPathFollow.position
	
	var randomRotation = randf_range(-PI/4, PI/4)
	var rotation = direction + randomRotation
		
	print('mob BEFORE add_child')
	add_child(mob)
	var velocity = mob.linear_velocity
	mob.rotation = rotation
	mob.linear_velocity = velocity.rotated(rotation)
	print('mob AFTER add_child')
