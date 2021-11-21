extends Node

const BaseRoom = preload("res://Scenes/Rooms/BaseRoom.gd")

var rooms = [
	preload("res://Scenes/Rooms/BasicRoom/BasicRoom.tscn")
]
var nav: Navigation2D
var container: Node2D

func _generate_room() -> void:
	var room: BaseRoom = rooms[randi() % rooms.size()].instance()
	room.init(self.nav)
	container.add_child(room)

func init(nav: Navigation2D, container: Node2D) -> void:
	self.nav = nav
	self.container = container

func generate() -> void:
	self._generate_room()
	
	
