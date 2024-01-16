extends Camera2D

var player

func _ready():
	player = get_tree().root.get_node("Main/Player")
	position = player.position

func _process(delta):
	position -= (position - player.position) / 5
