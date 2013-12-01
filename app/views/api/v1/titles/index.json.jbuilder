json.array!(@titles) do |titles|
  json.extract! titles, :id, :title, :image_url, :furigana, :keyword, :discription, :created_at
end