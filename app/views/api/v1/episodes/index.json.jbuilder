json.array!(@episodes) do |ep|
	json.extract! ep, 		:title_id
	json.extract! ep.title, :title
	json.extract! ep, 		:name, :url, :created_at
end

#json.array!(@titles) do |title|
#	json.extract! title, :id, :title
#	json.episodes @episodes, :name, :url, :created_at
#end
#json.episodes @episodes, :title_id, :name, :url, :created_at