class AddFieldnameToLiusers < ActiveRecord::Migration
  def change
    add_column :liusers, :linkedin_id, :string
    add_column :liusers, :first_name, :string
    add_column :liusers, :last_name, :string
    add_column :liusers, :headline, :string
    add_column :liusers, :industry, :string
    add_column :liusers, :picture_url, :string

  end
end
