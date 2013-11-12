json.extract! @titles, :id, :title
json.episodes @episodes, :name, :url, :image_url, :created_at
