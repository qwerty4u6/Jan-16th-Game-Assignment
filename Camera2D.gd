extends Camera2D

var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	position = player.position

func _process(delta):
	position.x -= (position.x - player.position.x) / 5
	position.y -= (position.y - player.position.y) / 5
