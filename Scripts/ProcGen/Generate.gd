extends Node

const BaseRoom = preload("res://Scenes/Rooms/BaseRoom.gd")
const CorridorScene = preload("res://Scenes/Rooms/Util/Corridor.tscn")

var rooms_start_collection = [
	preload("res://Scenes/Rooms/StartRooms/StartRoom1.tscn")
]

var rooms_collection = [
	preload("res://Scenes/Rooms/BasicRoom/BasicRoom.tscn"),
	preload("res://Scenes/Rooms/Room1/Room1.tscn"),
	preload("res://Scenes/Rooms/Room2/Room2.tscn")
]

var rooms_end_collection = [
	preload("res://Scenes/Rooms/EndRooms/EndRoom1.tscn")
]

var nav: Navigation2D
var container: Node2D

func init(nav: Navigation2D, container: Node2D) -> void:
	self.nav = nav
	self.container = container

func _get_rooms_map(size: int) -> AStar2D:
	var point_id_counter: int = 1
	var astar: AStar2D = AStar2D.new()
	var points_pool = {}
	var current: Vector2 = Vector2(0, 0)
	var current_id: int = 0
	points_pool[current] = current_id
	astar.add_point(current_id, current)
	for i in range(size - 1):
		while true:
			var new_point: Vector2 = current
			var new_point_id = point_id_counter
			if (randi() % 2):
				new_point.y += -1 if randi() % 2 else 1
			else:
				new_point.x += -1 if randi() % 2 else 1
			
			if (new_point in points_pool): # If point already exists
				# Connect new and current points
				astar.connect_points(current_id, points_pool[new_point])
				# make new point current
				current = new_point
				# get id
				current_id = points_pool[new_point]
			else:
				points_pool[new_point] = new_point_id
				astar.add_point(new_point_id, new_point)
				astar.connect_points(current_id, new_point_id)
				current = new_point
				current_id = new_point_id
				point_id_counter += 1
				break
#	var p = astar.get_points()
#	for i in p:
#		var cons = astar.get_point_connections(i)
#		for j in cons:
#			print(astar.get_point_position(i), astar.get_point_position(j))
	return astar

func generate(level: int) -> void:
	var rooms_amount = log(level * 10) * 2 + 3
	var rooms = []
	var room_start = rooms_start_collection[randi() % rooms_start_collection.size()].instance()
	var room_exit = rooms_end_collection[randi() % rooms_end_collection.size()].instance()
	
	# Add rooms into array
	for i in range(rooms_amount):
		var room: BaseRoom = rooms_collection[randi() % rooms_collection.size()].instance()
		rooms.append(room)
	rooms.insert(0, room_start)
	rooms.append(room_exit)
	
	var astar: AStar2D = _get_rooms_map(rooms.size())
	
	var point_ids = astar.get_points()

	for i in range(rooms.size()):
		var room: BaseRoom = rooms[i]
		var pos: Vector2 = astar.get_point_position(point_ids[i]) * ConfigTilemap.ROOMS_DISTANCE
		var conns = astar.get_point_connections(point_ids[i])
		
		room.position = pos
		container.add_child(room)
		room.init(self.nav)
		
		for conn in conns:
			var dir = astar.get_point_position(conn) - astar.get_point_position(point_ids[i])
			var entrance = room.get_entrance(dir)
			entrance.open()
	
	ConfigGame.player.position = room_start.get_player_spawn_position()
	ConfigGame.entity_container.add_child(ConfigGame.player)
	
	
