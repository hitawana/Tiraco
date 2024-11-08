extends Slot


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return data is Slot and data.slot_type == slot_type and data.sprite != sprite
