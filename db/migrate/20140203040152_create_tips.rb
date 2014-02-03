class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.string :activity_type
      t.text :description
      t.user :references

      t.timestamps
    end
  end
end
