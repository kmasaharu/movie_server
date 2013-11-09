class Title < ActiveRecord::Base
  has_many :episode # 複数形であること
end
