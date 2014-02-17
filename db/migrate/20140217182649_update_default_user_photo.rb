class UpdateDefaultUserPhoto < ActiveRecord::Migration
  def change
    change_column :users, :photo_url,  :text , default: "/assets/default_photo.jpg"
  end
end
