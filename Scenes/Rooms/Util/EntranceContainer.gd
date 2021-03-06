extends Node2D

const BaseRoom = preload("res://Scenes/Rooms/BaseRoom.gd")

export(NodePath) var room_path
export(NodePath) var tile_map_path

var tile_map: TileMap
var room: BaseRoom

func _ready():
	self.tile_map = get_node(tile_map_path)
	self.room = get_node(room_path)
	
	for entrance in get_children():
		entrance.init(self.room, self.tile_map)

func get_entrance(dir: Vector2):
	if (dir == Vector2(0, -1)):
		return $Top
	if (dir == Vector2(1, 0)):
		return $Right
	if (dir == Vector2(0, 1)):
		return $Bottom
	if (dir == Vector2(-1, 0)):
		return $Left
