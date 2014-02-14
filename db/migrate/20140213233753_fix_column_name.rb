class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :connections, :type, :c_type
    rename_column :tasks, :type, :t_type
  end
end
