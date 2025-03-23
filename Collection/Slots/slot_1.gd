extends Node2D

@export var slot_col_res : Collection_Slot
@export var nr_slot: String

@onready var sprite = $Sprite2D
@onready var atk_label = $AttackLabel
@onready var hlt_label = $HealthLabel
@onready var lvl_label = $LevelLabel
@onready var name_label = $NameLabel


func _ready() -> void:
	#self.hlt_label.text = '1'
	pass
	#print(slot_col_res.slot_nr)
	#print(nr_slot)

func _process(delta: float) -> void:
	if self.hlt_label != null:
		if int(self.hlt_label.text) <= 0:
			self.queue_free()

func setCard(atk: String, hlt: String, lvl: String, name: String, img: String):
	#print(nr_slot)
	self.atk_label.text = "" + str(atk)
	self.hlt_label.text = str(hlt)
	self.lvl_label.text = str(lvl)
	self.name_label.text = str(name)
	self.sprite.texture = load(str(img))


func setHealth(hlt: String):
	self.hlt_label.text = str(hlt)

func takeDamage(dmg: String):
	self.hlt_label.text = str(int(self.hlt_label.text) - int(dmg))

func getAttack():
	return self.atk_label.text

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass
	#print(area.get_parent().getStats())
	#print(self.nr_slot)
