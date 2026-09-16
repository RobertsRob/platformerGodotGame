extends Sprite2D

@onready var player: CharacterBody2D = get_node("/root/Main/Player")

func _process(_delta: float) -> void:
	if player != null:
		global_position.x = player.global_position.x * 0.9
		global_position.y = player.global_position.y
