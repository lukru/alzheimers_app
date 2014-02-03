class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :comment_text
      t.user :references
      t.tip :references

      t.timestamps
    end
  end
end
