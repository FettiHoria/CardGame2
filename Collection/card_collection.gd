extends Node2D

@onready var sprite = $Sprite2D
@onready var atk_label = $AttackLabel
@onready var hlt_label = $HealthLabel
@onready var lvl_label = $LevelLabel
@onready var name_label = $NameLabel

var initx: int
var inity: int
var dragThisNuts: bool = false

func setname():
	self.name_label = "bhuivjhjvh"


func card_assemble(atk: String, hlt: String, lvl: String, name: String, img: String, pos_x: int, pos_y: int) -> void:
	self.position.x = pos_x
	self.position.y = pos_y
	
	self.setInitialPosition(pos_x, pos_y)
	
	self.atk_label.text = "" + str(atk)
	self.hlt_label.text = str(hlt)
	self.lvl_label.text = str(lvl)
	self.name_label.text = str(name)
	self.sprite.texture = load(str(img))


func _ready():
	pass

func setInitialPosition(xint: int, yint: int):
	self.initx = xint
	self.inity = yint


func _process(delta):
	if self.dragThisNuts == true:
		self.global_position = get_global_mouse_position()
	if self.dragThisNuts == false:
		self.position.x = initx
		self.position.y = inity

func getDragStatus():
	return self.dragThisNuts



func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#print(event)
	if (event is InputEventMouseButton):
		self.dragThisNuts = event.pressed
		print(self.dragThisNuts)



func _on_area_2d_mouse_exited() -> void:
	self.dragThisNuts = false
	print(self.dragThisNuts)
