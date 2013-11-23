json.array!(@rankings) do |rank|
  json.extract! rank, :title_id, :count
end