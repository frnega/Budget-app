class CreateEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :amount
      t.string :name
      t.timestamps
    end
  end
end
