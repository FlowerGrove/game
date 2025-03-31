extends Panel

class_name Backpack

# 物品列表
var items = []

# 物品格子容器
var grid: GridContainer

# 物品资源
var item_resource: Item = preload("res://Item.tres")

# 初始化
func _ready():
	grid = $Grid
	load_items()
	update_grid()

# 更新格子显示
func update_grid():
	# 清空格子
	for child in grid.get_children():
		grid.remove_child(child)
		child.queue_free()

	# 根据物品列表更新格子
	for item in items:
		var slot = ItemSlot.new()
		slot.icon = item.icon
		grid.add_child(slot)

# 添加物品
func add_item(item: Item):
	items.append(item)
	update_grid()
	save_items()

# 删除物品
func remove_item(index: int):
	if index < items.size():
		items.remove_at(index)
		update_grid()
		save_items()

# 保存物品到文件
func save_items():
	var file = File.new()
	file.open("user://backpack_items.json", File.WRITE)
	file.store_string(to_json(items))
	file.close()

# 加载物品
func load_items():
	var file = File.new()
	if file.file_exists("user://backpack_items.json"):
		file.open("user://backpack_items.json", File.READ)
		var data = file.get_as_text()
		file.close()
		items = from_json(data)
		update_grid()

# 按钮回调
func _on_AddItemButton_pressed():
	var new_item = item_resource.duplicate()
	new_item.name = "New Item"
	new_item.icon = preload("res://icon.png")  # 替换为你的图标路径
	add_item(new_item)
