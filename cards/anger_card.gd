extends AttackCard

class_name Anger

func _init():
	super(0, "Anger")
	$CardText.text = "Deal 6 Damage.\nAdd a copy into your discard pile."
	
static func scene_name() -> String:
	return "anger"
