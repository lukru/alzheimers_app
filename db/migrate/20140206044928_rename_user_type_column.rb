class RenameUserTypeColumn < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :user_type
      t.text :user_bio
    end
  end
end
