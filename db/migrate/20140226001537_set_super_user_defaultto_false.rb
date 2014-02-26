class SetSuperUserDefaulttoFalse < ActiveRecord::Migration
  def change
    change_column :users, :superuser,  :boolean , default: false
  end
end
