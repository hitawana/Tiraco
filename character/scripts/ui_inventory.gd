extends Control

@onready var container: GridContainer = $Inventory/Container

func add_new_item(data: Dictionary) -> void:
	for slot in container.get_children():
		if slot.sprite == data.sprite:
			slot.amount += data.amount
			return
			
	for slot in container.get_children():
		if slot.sprite == null:
			slot.property = data
			return
