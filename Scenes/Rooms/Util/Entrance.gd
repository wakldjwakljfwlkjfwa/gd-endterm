extends Position2D

const BaseRoom = preload("res://Scenes/Rooms/BaseRoom.gd")

enum Angle {HORIZONTAL, VERTICAL}

export(Angle) var angle: int = Angle.HORIZONTAL

var room: BaseRoom
var tile_map: TileMap
var is_open: bool = false
var cell_pos: Vector2
var cell_floor_id: int
var cell_wall_id: int

func init(room: BaseRoom, tile_map: TileMap) -> void:
	self.room = room
	self.tile_map = tile_map
	self.cell_floor_id = self.room.cell_floor_id
	self.cell_wall_id = self.room.cell_wall_id
	self.cell_pos = self.tile_map.world_to_map(self.position)

func _set_cells(cell_id):
	for i in range(3):
		if angle == Angle.HORIZONTAL:
			tile_map.set_cellv(Vector2(cell_pos.x - 1 + i, cell_pos.y), cell_id)
		elif angle == Angle.VERTICAL:
			tile_map.set_cellv(Vector2(cell_pos.x, cell_pos.y - 1 + i), cell_id)

func open() -> void:
	self.is_open = true
	self._set_cells(cell_floor_id)

func close() -> void:
	self.is_open = false
	self._set_cells(cell_wall_id)
