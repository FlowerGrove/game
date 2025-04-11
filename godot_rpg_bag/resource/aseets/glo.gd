extends Node

signal get_slot_index(index:int)



var hp:float

var inv=InventoryData.new()

func  _load():
	inv = ResourceLoader.load("res://resource/aseets/information.tres") 
	return inv
func _save():
	ResourceSaver.save(inv,"res://resource/aseets/information.tres")
