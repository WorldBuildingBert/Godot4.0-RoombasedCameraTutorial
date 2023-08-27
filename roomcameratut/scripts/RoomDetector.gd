@tool
extends Area2D


@export var TILE_SIZE:int = 16
@export var ROOMPOSITION:=Vector2.ZERO
@export var ROOMSIZE := Vector2.ZERO
@export var update:bool = false

@export var leftupMargin:=Vector2.ZERO
@export var rightdownMargin:=Vector2.ZERO

signal roomEntered(roomposition, roomscale)

var roomposition = Vector2.ZERO
var roomscale = Vector2.ZERO

func _ready():
	$CollisionShape2D.shape.size = Vector2(TILE_SIZE, TILE_SIZE)
	$"CollisionShape2D".scale = ROOMSIZE
	$"CollisionShape2D".position = (ROOMSIZE - Vector2(1,1))*0.5*TILE_SIZE
	position = ROOMPOSITION*TILE_SIZE*1.0+Vector2(TILE_SIZE,TILE_SIZE)*0.5
	
	roomscale = (ROOMSIZE+rightdownMargin+leftupMargin)*TILE_SIZE
	roomposition = roomscale*0.5+(ROOMPOSITION-leftupMargin)*TILE_SIZE*1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if update:
		$CollisionShape2D.shape.size = Vector2(TILE_SIZE, TILE_SIZE)
		$"CollisionShape2D".scale = ROOMSIZE
		$"CollisionShape2D".position = (ROOMSIZE - Vector2(1,1))*0.5*TILE_SIZE
		position = ROOMPOSITION*TILE_SIZE*1.0+Vector2(TILE_SIZE,TILE_SIZE)*0.5
		update = false


func _on_body_entered(body):
	emit_signal("roomEntered", roomposition, roomscale)
