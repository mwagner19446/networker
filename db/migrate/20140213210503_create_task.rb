class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string "title"
      t.string "type"
      t.string "notes"
      t.references :user
    end
  end
end
