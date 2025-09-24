class_name myhurtbox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 4
	
func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	
func _on_area_entered(hitbox: myhitbox) -> void:
	if hitbox == null:
		return
		
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
		
