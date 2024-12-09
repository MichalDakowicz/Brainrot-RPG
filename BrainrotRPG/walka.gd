extends CharacterBody2D

@export var target_scene: String = "res://walka.tscn"  # Ścieżka do areny walki
var can_change_scene: bool = false  # Flaga kontrolująca zmianę sceny

func _ready():
	# Podłączenie sygnału `body_entered` z `Area2D`
	$Area2D.connect("body_entered", Callable(self, "_on_body_entered"))
	# Ustawienie flagi po krótkim czasie, aby uniknąć natychmiastowego przejścia
	await get_tree().create_timer(0.1).timeout
	can_change_scene = true

func _on_body_entered(body):
	# Sprawdzenie, czy obiekt to postać gracza i czy scena może zostać zmieniona
	if body is CharacterBody2D and can_change_scene:
		print("Przenoszenie na arenę walki...")
		call_deferred("change_scene")  # Odroczenie zmiany sceny

func change_scene():
	get_tree().change_scene_to_file(target_scene)  # Zmiana sceny na arenę walki
