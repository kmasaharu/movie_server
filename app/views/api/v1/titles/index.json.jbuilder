json.array!(@titles) do |titles|
  json.extract! titles, :id, :title, :favorite_count
end