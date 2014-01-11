class AddIsBroadcastingToTitles < ActiveRecord::Migration
  def change
    add_column :titles, :is_broadcasting, :boolean
  end
end
