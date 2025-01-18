extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var current_platform = null:
	set(value):
		# print(current_platform)
		if current_platform == value:
			return
		current_platform = value
		# when jump on bubble for multiple times, make it boom
		if current_platform is Bubble:
			current_platform.durability_decrease()
			pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	var collision_count = get_slide_collision_count()
	if collision_count == 0:
		current_platform = null
		pass
	for i in collision_count:
		var collision = get_slide_collision(i)
		# print("Collided with: ", collision.get_collider().name)
		current_platform = collision.get_collider()


func _die():
	queue_free()
	