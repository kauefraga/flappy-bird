extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	discord_sdk.app_id = 1184320707790897222
	discord_sdk.state = "Developing!"
	discord_sdk.details = "Coming soon..."
	
	discord_sdk.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"

	discord_sdk.refresh() # Always refresh after changing the values!

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
