class UpdateUserSuperuser < ActiveRecord::Migration
  def change
    change_table (:users) do |t|
      t.boolean :superuser
    end 
  end
end
