class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.user :references
      t.tip :references

      t.timestamps
    end
  end
end
