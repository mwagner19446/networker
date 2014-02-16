class UpdateConnection < ActiveRecord::Migration
  def change
    add_column :connections, :photo_url, :text
  end
end
