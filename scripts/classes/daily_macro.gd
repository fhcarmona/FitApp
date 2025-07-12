class_name Daily_Macro extends Node

## Daily Goal
var daily_kcal_goal: float = 0
var carbs_goal: float = 0
var protein_goal: float = 0
var fat_goal: float = 0
var fiber_goal: float = 0
var sodium_goal: float = 0

## Daily Intake
var daily_kcal_intake: float = 0
var carbs_intake: float = 0
var protein_intake: float = 0
var fat_intake: float = 0
var fiber_intake: float = 0
var sodium_intake: float = 0

## Constructor
func _init() -> void:
	daily_kcal_goal = 2099
	carbs_goal = 221
	protein_goal = 189
	fat_goal = 51
	fiber_goal = 25
	sodium_goal = 588
