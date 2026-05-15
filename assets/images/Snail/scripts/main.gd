extends Node2D
@onready var score_label: Label = $HUD/ScorePanel/ScoreLabel


var level: int = 1
var score: int = 0


func _ready() -> void:
	_setup_level()
	
func _process(_delta: float) -> void:
	pass
func _setup_level() -> void:
#	connect enemies
	var exit = $LevelRoot.get_node_or_null("Exit")
	if exit:
		exit.body_entered.connect(_on_exit_body_entered)
	
	
	var apples = $LevelRoot.get_node_or_null("Apples")
	if apples:
		for enemy in apples.get_children():
			enemy.collected.connect(increase_score)
	var enemies = $LevelRoot.get_node_or_null("Enemies")
	if enemies:
		for enemy in enemies.get_children():
			enemy.player_died.connect(_on_player_died)

	#else
#	signal handlers
func _on_exit_body_entered(body:Node2D) -> void:
	if body.name == "Player":
		level+=1
		print(level)
		body.can_move = false
		score_label.text = "You Win!!!"
func _on_player_died(body):
	body.die()
	print("Player killed")
	score_label.text = "Press R to reload"
	
#scores
func increase_score() -> void:
	score += 1
	score_label.text = "SCORE: %s" %score

	
