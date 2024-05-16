extends Node


func read_csv_data():
	var file = FileAccess.open("res://TQ/Assets/Items/ItemSheetA.csv",FileAccess.READ)
	var main_data = {}
	var true_data = []
	var formated_data = {}
	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		main_data[main_data.size()] = data_set
	file.close()
	main_data.erase(main_data.size()-1)
	
	var headers = main_data[0]
	for row_index in main_data:
		var base_obj = {}
		var colom_index = 0
		if row_index!=0:
			for data_index in main_data[row_index]:
				base_obj.size()
				base_obj.merge({headers[colom_index]:data_index})
				colom_index+=1
			true_data.append(base_obj)
			
	for item in true_data:
		
		formated_data.merge({int(item["Item_ID"]):item})
	return formated_data
