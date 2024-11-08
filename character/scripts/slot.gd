@tool
class_name Slot extends Control

@export var slot_type: Enum.SlotType

@export var sprite: Texture2D:
	set(value):
		sprite = value
		property.sprite = sprite
		get_node("sprite").texture = sprite

@export var amount: int:
	set(value):
		amount = value
		property.amount = amount
		get_node("amount").text = str(amount)
		get_node("amount").visible = amount > 1
		
@onready var property: Dictionary = {
	"sprite": sprite,
	"amount": amount, 
	"slot_type": slot_type,
}:
	set(value):
		property = value
		if property.amount >= 1:
			sprite = property.sprite
			amount = property.amount
			slot_type = property.slot_type	
		else:
			set_empty_slot()
		
func _get_drag_data(at_position: Vector2) -> Variant:
	var data = self.duplicate()
	data.get_node("background").hide()
	data.get_node("amount").hide()
	data.get_node("sprite").position = -data.size /2
	
	set_drag_preview(data)
	return self

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Slot
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	if data == self: return
	if sprite == data.sprite:
		amount += data.amount
		data.set_empty_slot()
	else:
		var temp_item = property
		var temp_sprite = sprite
		
		property = data.property
		sprite = data.sprite
		
		data.property = temp_item
		data.sprite = temp_sprite

func set_empty_slot() -> void:
	sprite = null
	amount = 0	
