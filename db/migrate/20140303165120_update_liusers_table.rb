class UpdateLiusersTable < ActiveRecord::Migration
  def change
    add_column :liusers, :location, :text
    add_column :liusers, :li_url, :text 
  end
end
