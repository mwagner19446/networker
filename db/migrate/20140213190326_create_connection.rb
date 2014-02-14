class CreateConnection < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.string "name"
      t.string "type"
      t.references :user
      t.references :liuser
    end
  end
end
