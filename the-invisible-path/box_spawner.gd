extends Node2D

# Spawner settings
@export var spawn_rate_min: float = 1.0  # Minimum time between spawns
@export var spawn_rate_max: float = 3.0  # Maximum time between spawns
@export var launch_speed: float = 500.0  # Speed of the launched object
@export var angle_min: float = -45.0     # Minimum launch angle in degrees
@export var angle_max: float = 45.0      # Maximum launch angle in degrees

@export var object_scene: PackedScene    # Assign your rigid body scene in the editor

var spawn_timer: Timer

func _ready():
	# Create and configure the spawn timer
	spawn_timer = Timer.new()
	add_child(spawn_timer)
	spawn_timer.one_shot = true
	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	
	# Start the first spawn
	_start_new_spawn_timer()

func _start_new_spawn_timer():
	# Set a random time for the next spawn
	var next_spawn_time = randf_range(spawn_rate_min, spawn_rate_max)
	spawn_timer.start(next_spawn_time)

func _on_spawn_timer_timeout():
	# Spawn the object
	spawn_object()
	# Start timer for next spawn
	_start_new_spawn_timer()

func spawn_object():
	# Instance the object
	var object = object_scene.instantiate()
	get_parent().add_child(object)
	
	# Set the spawn position
	object.global_position = global_position
	
	# Calculate random launch angle
	var random_angle = deg_to_rad(randf_range(angle_min, angle_max))
	
	# Calculate launch direction vector
	var launch_direction = Vector2.RIGHT.rotated(random_angle)
	
	# Apply impulse to the rigid body
	if object is RigidBody2D:
		object.linear_velocity = launch_direction * launch_speed
