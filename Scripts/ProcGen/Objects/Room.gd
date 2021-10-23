extends Object

var _room_min_size: int = 16
var _room_max_size: int = 32

var rec_size: Vector2

func _init(width: int = 15, height: int = 15) -> void:
	self._room_min_size = 16
	self._room_max_size = 32
	
	var minmax_size_diff: int = self._room_max_size - self._room_min_size

	if width < self._room_min_size || width > self._room_max_size:
		width = randi() % minmax_size_diff + 1 + self._room_min_size
	if height < self._room_min_size || height > self._room_max_size:
		height = randi() % minmax_size_diff + 1 + self._room_min_size
	self.rec_size = Vector2(width, height)

func _to_string() -> String:
	return "[Room: (size: {size})]".format({'size': self.rec_size})

