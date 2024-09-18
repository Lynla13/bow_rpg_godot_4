extends Resource
class_name ENEMY

@export var NAME : String
@export var HP : int
@export var SPEED : int
@export var DAM : int
@export var LEVEL : int
@export var DEF : int 
enum _role {a,b,c}
@export var ROLE : _role 
enum _status {a,b,c}
@export var STATUS : _status
@export var Item : ITEM

#todo : caculate level stuff
