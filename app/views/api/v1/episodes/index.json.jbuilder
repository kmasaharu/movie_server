json.array!(@episodes) do |ep|
	json.title_id 		ep.title_id
	json.episode_id 	ep.id
	json.extract! 		ep, :name, :url, :image_url, :created_at
end

#json.array!(@titles) do |title|
#	json.extract! title, :id, :title
#	json.episodes @episodes, :name, :url, :created_at
#end
#json.episodes @episodes, :title_id, :name, :url, :created_at