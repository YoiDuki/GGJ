extends Node2D


@export var bubble_scene: PackedScene = preload("res://scenes/static_bubble.tscn")
@export var spawn_interval: float = 1.0
@export var spawn_count: int = 1
# @export var spawn_radius: float = 100.0
@export var spawn_speed: float = 100.0
@export var spwan_durability: int = 3 

var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.timeout.connect(_spwan_bubble)
	add_child(timer)
	timer.start()
	_spwan_bubble()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _spwan_bubble() -> void:
	for i in range(spawn_count):
		var bubble: Bubble = bubble_scene.instantiate()
		add_child(bubble)
		bubble.position = position
		bubble.speed = spawn_speed
		bubble.durability = spwan_durability
