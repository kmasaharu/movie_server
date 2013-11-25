class Episode < ActiveRecord::Base
    belongs_to :site
    belongs_to :title
   
    validates :name,       presence: true
    validates :url,        presence: true
    validates_format_of :url, :with => URI.regexp(['http', 'https', 'ftp']), :message => "not http:// or https:// start"
    validates :image_url,        presence: true
    validates_format_of :image_url, :with => URI.regexp(['http', 'https', 'ftp']), :message => "not http:// or https:// start"
end
