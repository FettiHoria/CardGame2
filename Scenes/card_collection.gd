extends Node2D

@onready var sprite = $Sprite2D
@onready var atk_label = $AttackLabel
@onready var hlt_label = $HealthLabel
@onready var lvl_label = $LevelLabel
@onready var name_label = $NameLabel


func setname():
	print("wtf")
	self.name_label = "bhuivjhjvh"

func card_assemble(atk: String, hlt: String, lvl: String, name: String, img: String) -> void:
	self.position.x = 100
	self.position.y = 200
	print("atk: " + atk)
	print("img: " + img)
	self.atk_label.text = "" + str(atk)
	self.hlt_label.text = str(hlt)
	self.lvl_label.text = str(lvl)
	self.name_label.text = str(name)
	self.sprite.texture = load(str(img))


func _ready():
	#atk_label.text = "hjio"
	print("steaua")
