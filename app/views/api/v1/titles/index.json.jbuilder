json.array!(@titles) do |titles|
  json.extract! titles, :id, :title, :image_url, :furigana, :keyword, :is_broadcasting, :is_locking, :discription, :created_at
end