extends Control

onready var levelText : Label = get_node("BG/LevelBG/LevelText")
onready var healthBar : TextureProgress = get_node("BG/HealthBar")
onready var xpBar : TextureProgress = get_node("BG/xpBar")
onready var goldText : Label = get_node("BG/GoldText")

func update_level_text (level):
	
	levelText.text = str(level)
	
func update_health_bar (curHP, maxHP):
	
	healthBar.value = (100 / maxHP) * curHP
	
func update_xp_bar (curXP, xpToNextLevel):
	xpBar.value = (100 / xpToNextLevel) * curXP;
	
func update_gold_text (gold):
	
	goldText.text = "Gold: " + str(gold)
