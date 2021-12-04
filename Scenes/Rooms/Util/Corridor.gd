extends TileMap

var cell_floor_id: int = ConfigTilemap.CELL_FLOOR_ID
var cell_wall_id: int = ConfigTilemap.CELL_WALL_ID

func generate(dir: Vector2, size: int) -> void:
	for i in range(size):
		var pos: Vector2 = dir * i
		var dir_normal = Vector2(abs(dir.y), abs(dir.x))
		set_cellv(pos + dir_normal * Vector2(2, 2), cell_wall_id)
		set_cellv(pos + dir_normal * Vector2(1, 1), cell_floor_id)
		set_cellv(pos, cell_floor_id)
		set_cellv(pos + dir_normal * Vector2(-1, -1), cell_floor_id)
		set_cellv(pos + dir_normal * Vector2(-2, -2), cell_wall_id)
