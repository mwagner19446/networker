class CreateToken < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string "expires_in"
      t.text "access_token"
      t.references :user
    end
  end
end
