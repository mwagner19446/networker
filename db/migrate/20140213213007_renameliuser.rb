class Renameliuser < ActiveRecord::Migration
  def change
    rename_table :li_users, :liusers
  end
end