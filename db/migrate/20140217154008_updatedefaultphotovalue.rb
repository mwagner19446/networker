class Updatedefaultphotovalue < ActiveRecord::Migration
  def change
    change_column :connections, :photo_url,  :text , default: "/assets/default_photo.jpg"
  end
end
