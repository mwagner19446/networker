class RemoveDefaultValueforPhoto < ActiveRecord::Migration
  def change
    change_column :users, :photo_url,  :text , default: ""
  end
end
