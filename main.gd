extends Node

@export var Mob: PackedScene 

@onready var player: Area2D = $Player
@onready var mobPath: Path2D = $MobPath
@onready var mobPathFollow: PathFollow2D = $MobPath/MobPathFollow
@onready var hud: CanvasLayer = $HUD

const HEALTH = 3

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewport_dimensions = get_viewport().get_visible_rect()
	var size = viewport_dimensions.size
	
	player.position = size / 2 


# dear gregoress, ur a qt3.14
# your secret admirer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mob_timer_timeout() -> void:
	var mob: RigidBody2D = Mob.instantiate()
	
	var progress_ratio = randf()
	
	mobPathFollow.progress_ratio = progress_ratio
	var direction = mobPathFollow.rotation + PI/2
	
	mob.position = mobPathFollow.position
	
	var randomRotation = randf_range(-PI/4, PI/4)
	var rotation = direction + randomRotation
		
	add_child(mob)
	var velocity = mob.linear_velocity
	mob.rotation = rotation
	mob.linear_velocity = velocity.rotated(rotation)


func _on_hud_start_game() -> void:
	score = 0
	hud.set_score(score)
	$ScoreTimer.start()
	player.health = HEALTH
	
	$MobTimer.start()
	$BackgroundMusic.play()
	$GameOverMusic.stop()


func _on_score_timer_timeout() -> void:
	score += 1
	hud.set_score(score)


func _on_player_player_dead() -> void:
	print("player dead!!!")
	$ScoreTimer.stop()
	$MobTimer.stop()
	$BackgroundMusic.stop()
	$GameOverMusic.play()
	
	get_tree().call_group("mobs", "queue_free")
