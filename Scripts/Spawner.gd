extends Node


export var tubesPreGen = 8
export(Array, PackedScene) var tubesPack

onready var ball = get_node("Ball")
onready var tubes = $Tubes


func _ready():
	for child in tubes.get_children():
		child.queue_free()
	var startTube = tubesPack[2].instance()
	startTube.get_node("OuterPortals").get_node("Begin").isConnected = true
	Global.genSteps.append([startTube])
	tubes.add_child(startTube)
	randomize()
	
	while Global.genSteps.size() != tubesPreGen:
		var step = []
		for tube in Global.genSteps.back():
			for endPortal in tube.get_node("OuterPortals").get_node("Ends").get_children():
				endPortal.isConnected = true
				var genTube = tubesPack[int(rand_range(0, tubesPack.size()))].instance()
				tubes.add_child(genTube)
				
				var beginPortal = (genTube.get_node("OuterPortals").get_node("Begin"))
				beginPortal.isConnected = true
				genTube.global_transform = endPortal.global_transform
				
				var offset = endPortal.transform.origin - beginPortal.transform.origin
				
				step.append(genTube)
		Global.genSteps.append(step)
