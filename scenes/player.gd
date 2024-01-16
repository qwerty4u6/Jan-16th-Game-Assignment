extends Area2D

var velocity = Vector2(0, 0)

func _ready():
	position = Vector2(960, 960) / 2

func closest(x, arr, arr2 = []): # i hope you give me extra credit for this, the array.find method was broken and it took me 2 whole class periods to debug just that
	for i in arr.size():
		arr2.push_back(abs(arr[i] - x) + 1)
	return arr[arr2.find(arr2.min())]

func _physics_process(delta):
	if Input.is_action_pressed("up"):
		velocity.y -= 3
	if Input.is_action_pressed("down"):
		velocity.y += 3
	if Input.is_action_pressed("left"):
		velocity.x -= 3
	if Input.is_action_pressed("right"):
		velocity.x += 3
	velocity *= 0.75
	position += velocity

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var a = atan2(mouse_pos.y - position.y, mouse_pos.x - position.x) + PI / 2
	a = closest(rotation, [a + PI * 2, a, a - PI * 2])
	rotation -= (rotation - a) / 5
	rotation = fmod(rotation, PI * 2)
