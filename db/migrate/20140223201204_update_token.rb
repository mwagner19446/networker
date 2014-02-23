class UpdateToken < ActiveRecord::Migration
  def change
    add_column :tokens, :access_date, :datetime
  end
end
