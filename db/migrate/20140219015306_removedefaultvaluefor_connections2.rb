class RemovedefaultvalueforConnections2 < ActiveRecord::Migration
  def change
    change_column :connections, :photo_url,  :text , default: ""
  end
end
