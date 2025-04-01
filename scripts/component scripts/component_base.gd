extends Node2D
class_name ComponentBase
# Every component must have these defined
var component_id = ""
var component_type = "" # e.g., "cpu", "ram", "vrm"
var required_inputs = [] # e.g., ["power", "clock"]
var allowed_outputs = [] # e.g., ["data", "control"]

var connected_inputs = {}
var connected_outputs = {}

var state = "idle" # idle, active, powered, error

func _ready():
	component_id = generate_unique_id()

func generate_unique_id():
	return str(component_type) + "_" + str(randi())

func connect_wire(to_component: Node, wire_type: String):
	if wire_type in allowed_outputs and wire_type in to_component.required_inputs:
		var wire = preload("res://scenes/components/Wire.tscn").instantiate()
		wire.source = self
		wire.target = to_component
		wire.wire_type = wire_type
		get_tree().root.add_child(wire)
		wire.update_position()

		connected_outputs[to_component.component_id] = wire
		to_component.connected_inputs[component_id] = wire
	else:
		print("Incompatible connection")
