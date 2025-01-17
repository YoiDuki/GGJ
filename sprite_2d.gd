extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position += Vector2.LEFT * 10 * delta
		pass
	pass


func _input(event: InputEvent) -> void:
	pass
	# var tween = get_tree().create_tween()
	# var target_position = position
	# if event is InputEventKey:
	# 	if event.is_action("ui_left"):
	# 		target_position = position + Vector2.LEFT * 10
	# 	if event.is_action("ui_right"):
	# 		target_position = position + Vector2.RIGHT * 10
	# 	if event.is_action("ui_up"):
	# 		target_position = position + Vector2.UP * 10
	# 	if event.is_action("ui_down"):
	# 		target_position = position + Vector2.DOWN * 10
	# tween.tween_property(self, "position", target_position, 1)
	
