extends Node2D

var cell_floor_id: int = ConfigTilemap.CELL_FLOOR_ID
var cell_wall_id: int = ConfigTilemap.CELL_WALL_ID

func _ready():
	pass

func init(nav: Navigation2D) -> void:
	var nav_polygon = $NavigationPolygonInstance
	self.remove_child(nav_polygon)
	nav_polygon.global_position = self.global_position
	nav.add_child(nav_polygon)

func get_used_rect() -> Rect2:
	return $Layer1.get_used_rect()

func get_entrance(dir: Vector2):
	return $EntranceContainer.get_entrance(dir)
