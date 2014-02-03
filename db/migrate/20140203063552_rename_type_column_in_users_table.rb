class RenameTypeColumnInUsersTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :type
      t.string :user_type
    end
  end
end
