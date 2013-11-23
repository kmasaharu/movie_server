json.array!(@titles) do |titles|
  json.extract! titles, :id, :title, :image_url
end