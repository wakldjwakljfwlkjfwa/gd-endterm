extends Node2D

var cell_floor_id: int = 1
var cell_wall_id: int = 2

func _ready():
	pass

func init(nav: Navigation2D) -> void:
	var nav_polygon = $NavigationPolygonInstance
	self.remove_child(nav_polygon)
	nav_polygon.global_position = self.global_position
	nav.add_child(nav_polygon)
