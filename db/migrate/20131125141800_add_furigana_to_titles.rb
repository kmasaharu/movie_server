class AddFuriganaToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :furigana, :string
    add_column :titles, :keyword, :text
  end
end
