extends KinematicBody2D

var curHp : int = 5
var maxHp : int = 5

var moveSpeed : int = 150
export var xpToGive : int = 30

var damage : int = 1
var attackRate : float = 1.0
var attackDist : int = 80
var chaseDist : int = 400

onready var timer = get_node("Timer")
onready var enim = get_node("AnimatedSprite")
onready var target = get_node("/root/MainScene/Player")

func _ready():
	
	timer.wait_time = attackRate
	timer.start()

func _physics_process (delta):
	
	var dist = position.distance_to(target.position)
	
	if dist > attackDist and dist < chaseDist:
		
		var vel = (target.position - position).normalized()
		
		move_and_slide(vel * moveSpeed)
		
	

# if then target.position "moveblabla" ---- or not



func _on_Timer_timeout():
	#to check dist every sec ---- if the player is within dist, the enemy wil dmg the player
	if position.distance_to(target.position) <= attackDist:
		target.take_damage(damage)
		
func take_damage (dmgToTake):
	#dmg count
	curHp -= dmgToTake
	
	# 0 hp = ded
	if curHp <= 0:
		die()
		
func die():
	#xp for the player
	target.give_xp(xpToGive)
	#hocus pocus your enemy is ded ---- deletes the sprite
	queue_free()
