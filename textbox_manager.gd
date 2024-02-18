extends CanvasLayer

const FRAME = preload("res://frame/frame1.tscn")
var screen_size #画面サイズを取ってくる
var scale_size: int #カメラの倍率



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	scale_size = 3
	#main_textbox("")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func main_textbox(_text: String):
	var textbox = FRAME.instantiate()
	add_child(textbox)
	#ボタンとコネクトして消去関数を作成
	textbox.S_click.connect(showmetsu.bind(textbox))
	
	#サイズ、位置の調整
	#NinePatchRect
	textbox.get_node("NinePatchRect").set("scale",Vector2(scale_size,scale_size))
	textbox.get_node("NinePatchRect").set("size",Vector2(screen_size.x / scale_size, (screen_size.y / 4) / scale_size))
	textbox.get_node("NinePatchRect").set("position",Vector2(0, (screen_size.y / 4) * scale_size))
	#Button
	textbox.get_node("Button").set("size",Vector2(screen_size.x, screen_size.y / 4))
	textbox.get_node("Button").set("position",Vector2(0, (screen_size.y / 4) * scale_size))
	#MarginContainer
	textbox.get_node("MarginContainer").set("position",Vector2(0, (screen_size.y / 4) * scale_size))
	textbox.get_node("MarginContainer").set("size",Vector2((screen_size.x) * 2, (screen_size.y / 4) * 2))
	
	print("textsize...",textbox.get_node("MarginContainer").get("size"))
	
	#テキストの代入
	textbox.get_node("MarginContainer").get_node("Label").text = _text
	print("text...", textbox.get_node("MarginContainer").get_node("Label").text)
	
	
#テキストを削除
func showmetsu(_textbox):
	print("!!!")
	_textbox.queue_free()
	print("showmetsu!!!")
