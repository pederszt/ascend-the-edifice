extends Area2D

#positioning
var t_pos : Vector2 = Vector2(0,0)
var t_rot : float = 0.0
var t_z_idx : int = 10
var m_pos = null
var follow_mouse = false
var focus = false

#metadata
var targeted : bool = false
var card_name : String = "Strike"
var card_type : String = "Attack"

@export var speed = 12500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = 10
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Get the card's current position
	var card_position = position
	
	# Which way is the target from here
	var direction = get_current_target() - card_position
	
	if direction.length() < 5:
		position = card_position
		return
		
	# change speed based on how far from the target we are
	var calc_speed = sqrt(direction.length() * speed) 
	
	# Update position
	position = card_position + (direction.normalized() * calc_speed * delta)	
		

func set_text(text: String) -> void:
	$Label.text = text

func set_target(target: Vector2) -> void:
	t_pos = target

func set_default_rotation(rot: float) -> void:
	t_rot = rot
	
func get_current_target() -> Vector2:
	var target = t_pos
	if m_pos:
		target = m_pos
	
	if focus or m_pos:
		rotation = 0
	
	if focus and !m_pos:
		z_index = 100
		target.y -= 40
	else:
		z_index = t_z_idx
		rotation = t_rot

	if m_pos:
		rotation = 0
	
	return target
	
func set_targeted(targeted:bool) -> void:
	self.targeted = targeted	

func set_card_name(cn:String) -> void:
	self.card_name = card_name
	$CardNameLabel.text = self.card_name

func _on_card_rect_gui_input(event: InputEventMouse) -> void:
	if 'button_index' in event and event.button_index == 1:
		if event.pressed:
			follow_mouse = true
		else:
			follow_mouse = false
			m_pos = null
		
	if follow_mouse:
		var parent_pos = get_parent().position
		var relative_pos = get_global_mouse_position() - parent_pos
		m_pos = relative_pos
	

func _on_card_rect_mouse_entered() -> void:
	focus = true

func _on_card_rect_mouse_exited() -> void:
	focus = false
