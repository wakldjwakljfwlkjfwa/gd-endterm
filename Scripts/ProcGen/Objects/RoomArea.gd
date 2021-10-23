extends Object

var _room_min_size: int = 16
var _room_max_size: int = 32

var pos_x: int
var pos_y: int
var width: int
var height: int

func _init(pos_x: int, pos_y: int,
		width: int = 15, height: int = 15) -> void:
	# TODO: Replace with configuration variables
	self._room_min_size = 16
	self._room_max_size = 32
	
	self.pos_x = pos_x
	self.pos_y = pos_y

	var minmax_size_diff: int = self._room_max_size - self._room_min_size

	if width < self._room_min_size || width > self._room_max_size:
		self.width = randi() % minmax_size_diff + 1 + self._room_min_size
	if height < self._room_min_size || height > self._room_max_size:
		self.height = randi() % minmax_size_diff + 1 + self._room_min_size

func _to_string() -> String:
	var output: String = "[Room: (pos_x: {pos_x}, pos_y: {pos_y}, width: {width}, height: {height})]"
	return output.format({
		'pos_x': self.pos_x, 'pos_y': self.pos_y,
		'width': self.width, 'height': self.height})

