extends ColorRect

var daily_stats: Daily_Macro

## Constants
const DAILY_GOAL_TEXT = "Meta diária: {daily_kcal_goal}kcal"
const CARB_GOAL_TEXT = "{carb_intake}g / {carb_goal}g [{remaining}]"
const PROTEIN_GOAL_TEXT = "{protein_intake}g / {protein_goal}g [{remaining}]"
const FAT_GOAL_TEXT = "{fat_intake}g / {fat_goal}g [{remaining}]"
const FIBER_INTAKE_TEXT = "{fiber_intake}g"
const SODIUM_INTAKE_TEXT = "{sodium_intake}mg"
const DAILY_KCAL_INTAKE_TEXT = "{daily_kcal_intake}kcal"

## GUI
@export var daily_kcal_goal: Label
@export var carb_goal: Label
@export var protein_goal: Label
@export var fat_goal: Label
@export var fiber_intake: Label
@export var sodium_intake: Label
@export var daily_kcal_intake: Label

@export var carbs_slider: Slider
@export var protein_slider: Slider
@export var fat_slider: Slider
@export var calories_slider: Slider

func _ready() -> void:
	daily_stats = Daily_Macro.new()
	
	## Set slider max values
	carbs_slider.set_max(daily_stats.carbs_goal)
	protein_slider.set_max(daily_stats.protein_goal)
	fat_slider.set_max(daily_stats.fat_goal)
	calories_slider.set_max(daily_stats.daily_kcal_goal)
	
func _process(_delta: float) -> void:
	## Daily kcal goal
	daily_kcal_goal.set_text(
		DAILY_GOAL_TEXT.format(
			{"daily_kcal_goal": daily_stats.daily_kcal_goal}))
	
	## Update macro values
	calculate_carbs()
	calculate_protein()
	calculate_fat()
	
	## Daily fiber intake		
	fiber_intake.set_text(
		FIBER_INTAKE_TEXT.format(
			{"fiber_intake": daily_stats.fiber_intake}))
			
	## Daily sodium intake
	sodium_intake.set_text(
		SODIUM_INTAKE_TEXT.format(
			{"sodium_intake": daily_stats.sodium_intake}))
	
	## Daily calories intake
	daily_kcal_intake.set_text(
		DAILY_KCAL_INTAKE_TEXT.format(
			{"daily_kcal_intake": daily_stats.daily_kcal_intake}))

## Calculate carbs relative to the goal
func calculate_carbs() -> void:
	var remaining_carbs = daily_stats.carbs_goal - daily_stats.carbs_intake
	
	carb_goal.set_text(
		CARB_GOAL_TEXT.format(
			{"carb_intake": daily_stats.carbs_intake, "carb_goal": daily_stats.carbs_goal, "remaining": remaining_carbs}))

## Calculate protein relative to the goal
func calculate_protein() -> void:
	var remaining_protein = daily_stats.protein_goal - daily_stats.protein_intake
	
	protein_goal.set_text(
		PROTEIN_GOAL_TEXT.format(
			{"protein_intake": daily_stats.protein_intake, "protein_goal": daily_stats.protein_goal, "remaining": remaining_protein}))

## Calculate fat relative to the goal
func calculate_fat() -> void:
	var remaining_fat = daily_stats.fat_goal - daily_stats.fat_intake
	
	fat_goal.set_text(
		FAT_GOAL_TEXT.format(
			{"fat_intake": daily_stats.fat_intake, "fat_goal": daily_stats.fat_goal, "remaining": remaining_fat}))

## Slider values update (QA Only Purpose)
func _on_carbs_slider_value_changed(value: float) -> void:
	daily_stats.carbs_intake = value

func _on_protein_slider_value_changed(value: float) -> void:
	daily_stats.protein_intake = value

func _on_fat_slider_value_changed(value: float) -> void:
	daily_stats.fat_intake = value

func _on_calories_slider_value_changed(value: float) -> void:
	daily_stats.daily_kcal_intake = value
