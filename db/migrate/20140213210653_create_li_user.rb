class CreateLiUser < ActiveRecord::Migration
  def change
    create_table :li_users do |t|
      t.string "linkedin_id"
      t.string "first_name"
      t.string "last_name"
      t.string "headline"
      t.string "industry"
      t.string "picture_url"
    end
  end
end
