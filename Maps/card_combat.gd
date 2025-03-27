extends Node2D

@onready var sprite = $Sprite2D
@onready var atk_label = $AttackLabel
@onready var hlt_label = $HealthLabel
@onready var lvl_label = $LevelLabel
@onready var name_label = $NameLabel

var initx: int
var inity: int

var data = {}
var targeted_slot: String = ""

var atk
var hlt 
var lvl
var sl_name
var img
var pos_x
var pos_y


func _ready():
	self.card_assemble(str(atk),str(hlt),str(lvl),str(sl_name),str(img),int(pos_x),int(pos_y))

func setStats(atk, hlt, lvl, sl_name, img, pos_x, pos_y):
	self.atk = atk
	self.hlt = hlt
	self.lvl = lvl
	self.sl_name = sl_name
	self.img = img
	self.pos_x = pos_x
	self.pos_y = pos_y

func card_assemble(atk: String, hlt: String, lvl: String, name: String, img: String, pos_x: int, pos_y: int) -> void:
	self.position.x = pos_x
	self.position.y = pos_y
	
	self.setInitialPosition(pos_x, pos_y)
	
	print(pos_x)
	
	self.atk_label.text = str(atk)
	self.hlt_label.text = str(hlt)
	self.lvl_label.text = str(lvl)
	self.name_label.text = str(name)
	self.sprite.texture = load(str(img))


func setInitialPosition(xint: int, yint: int):
	self.initx = xint
	self.inity = yint


func _process(delta):
	pass

func getSpritePath():
	return $Sprite2D.texture.resource_path

func getStats():
	data["level"] = self.lvl_label.text
	data["health"] = self.hlt_label.text
	data["attack"] = self.atk_label.text
	data["name"] = str(self.name_label.text)
	data["image"] = self.getSpritePath()
	return data
