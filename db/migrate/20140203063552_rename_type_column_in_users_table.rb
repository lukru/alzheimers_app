class RenameTypeColumnInUsersTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :typegit
      t.string :user_type
    end
  end
end
