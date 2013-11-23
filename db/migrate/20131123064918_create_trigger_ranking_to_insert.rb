class CreateTriggerRankingToInsert < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TRIGGER triger_insert_title AFTER INSERT 
      ON titles FOR EACH ROW
      BEGIN
          INSERT INTO rankings (created_at, updated_at, title_id, count) VALUES (NEW.created_at, NEW.updated_at, NEW.id, 0);
      END
    SQL
  end
end
