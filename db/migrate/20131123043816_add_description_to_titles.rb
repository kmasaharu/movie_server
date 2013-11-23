class AddDescriptionToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :discription, :text
  end
end
