class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.string :activity_type
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
