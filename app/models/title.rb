class Title < ActiveRecord::Base
  has_many  :episode 
  has_one   :ranking
  
  validates :title,       presence: true
  validates :image_url,   presence: true
  validates_format_of :image_url, :with => URI.regexp(['http', 'https', 'ftp']), :message => "not http:// or https:// start"
  validates :title,       presence: true
  validates :discription, presence: true

end
