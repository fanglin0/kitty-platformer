extends Area2D
const SPEED = 100.0
@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal player_died(body)
var direction = -1.0

func _ready() -> void:
	pass
	
#	delta = elapsed time
func _process(delta:float) -> void:
	position.x += direction * SPEED * delta


func _on_timer_timeout() -> void:
	direction *= -1
	animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h

func _on_body_entered(body: Node2D) -> void:
	#print(body.name) # Replace with function body.
	if body.name == "Player" and body.alive:
		player_died.emit(body)
