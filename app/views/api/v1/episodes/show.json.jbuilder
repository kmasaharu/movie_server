json.title_id 	@titles.id
json.title 		@titles.title
json.episodes 	@episodes, :id, :name, :url, :image_url, :created_at
