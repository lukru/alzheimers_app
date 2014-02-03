class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author_name
      t.text :comment_text
      t.references :user
      t.references :tip

      t.timestamps
    end
  end
end
