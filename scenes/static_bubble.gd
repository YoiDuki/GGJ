extends AnimatableBody2D
class_name Bubble

const SCALE_RATE = 0.05

@onready var sprite: Sprite2D = $Bubble
@onready var collision: CollisionShape2D = $CollisionShape2D

@export var durability = 3
@export var speed = 100
@export var direction = Vector2.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.scale = Vector2.ONE * .1
	collision.scale = Vector2.ONE * .1
	sync_to_physics = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	sprite.scale += Vector2.ONE * SCALE_RATE * delta
	collision.scale += Vector2.ONE * SCALE_RATE * delta
	position += direction * speed * delta


func durability_decrease():
	durability -= 1
	if durability <= 0:
		destroy()


func destroy():
	queue_free()