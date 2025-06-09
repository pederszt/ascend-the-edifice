extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_target(target: Vector2) -> void:
	var angle = Vector2.ZERO.angle_to_point(target)
	rotation = angle - PI # account for the arrow pointing right instead of up
