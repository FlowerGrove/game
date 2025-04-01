
#全局脚本

extends  Node

#代码重构保存

const save_json = "user://SaveFlie.json"
var content_to_save:Dictionary = {
	"hp" : 0.0,
	"mp" : 0.0,
	"attack":0.0,
	"defence":0.0
}

func _save():
	var file = FileAccess.open(save_json,FileAccess.WRITE)
	file.store_var(content_to_save.duplicate())
	file.close() 
	
func _load():
	if FileAccess.file_exists(save_json):
		var file = FileAccess.open(save_json,FileAccess.READ)
		var data = file.get_var()
		file.close()
		
		var save_data = data.duplicate()
		
		
		content_to_save.player_pos = save_data.player_pos
		content_to_save.progress_bar_value = save_data.progress_bar_value
		
		print(content_to_save)
