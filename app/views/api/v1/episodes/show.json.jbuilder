json.extract! @titles, :id, :title
json.episodes @episodes, :id, :name, :url, :image_url, :created_at
