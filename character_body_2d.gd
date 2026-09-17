extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -900.0
@onready var particles: GPUParticles2D = $MoveParticles

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		particles.emitting = false
	else:
		particles.emitting = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	global_position = Vector2(0, 0)


func _on_portal_box_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")	
