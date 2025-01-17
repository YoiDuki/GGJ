extends StaticBody2D


const SPEED = 200.0

@onready var sprite: Sprite2D = $Bubble
@onready var collision: CollisionShape2D = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.scale = Vector2.ONE * .1
	collision.scale = Vector2.ONE * .1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.scale += Vector2.ONE * .1 * delta
	collision.scale += Vector2.ONE * .1 * delta
	position += Vector2.UP * SPEED * delta


# Called when the collision shape enters another body.
func _on_body_entered(body: Node) -> void:
	print("Collided with: ", body.name)