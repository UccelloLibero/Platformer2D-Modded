extends AnimatedSprite2D
#
## Speed at which the bird moves towards the main character
#var follow_speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true) # Replace with function body.




# Reference to the main character node
@onready var main_character = get_node("../../MainCharacter")  # Adjust path as necessary

# Speed at which the follower moves towards the main character
@export var follow_speed = 100.0

func _process(delta):
	if not main_character:
		return

	# Calculate the direction to the main character
	var direction = main_character.global_position - global_position
	
	# Move the sprite if it's not close enough
	if direction.length() > 20:
		direction = direction.normalized()
		global_position += direction * follow_speed * delta

		# Optional: Adjust the sprite's orientation based on direction
		flip_h = direction.x < 0
