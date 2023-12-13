extends CharacterBody2D
signal hit


var speed = 1
var jump_force = 250
var screen_size

@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _physics_process(delta):
	velocity.y += gravity * delta
	movement(delta)
	
func movement(delta):
	velocity.x += speed
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
		
	if velocity.length() > 0:
		$AnimatedSprite2D.play("fly")
	else:
		$AnimatedSprite2D.stop()
		
	if velocity.y < 0:
		$AnimatedSprite2D.rotation = -PI / 4
	elif velocity.y > 0:
		$AnimatedSprite2D.rotation = PI / 4
		
	position = position.clamp(Vector2.ZERO, screen_size)
	move_and_slide()

func _on_body_entered(body):
	hide()
	hit.emit()
	
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
