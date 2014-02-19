class RemovedefaultvalueforConnections < ActiveRecord::Migration
  def change
    change_column :connections, :photo_url,  :text
  end
end
