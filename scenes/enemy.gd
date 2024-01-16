extends Area2D

var player

var velocity = Vector2(0, 0)

func _ready():
	player = get_tree().root.get_node("Main/Player")
	
	var player_pos = player.position
	rotation = atan2(player_pos.y - position.y, player_pos.x - position.x) + PI / 2

func closest(x, arr, arr2 = []):
	for i in arr.size():
		arr2.push_back(abs(arr[i] - x) + 1)
	return arr[arr2.find(arr2.min())]

func _physics_process(delta):
	velocity *= 0.75
	position += velocity

func _process(delta):
	var player_pos = player.position
	var a = atan2(player_pos.y - position.y, player_pos.x - position.x) + PI / 2
	a = closest(rotation, [a + PI * 2, a, a - PI * 2])
	rotation -= (rotation - a) / 5
	rotation = fmod(rotation, PI * 2)
