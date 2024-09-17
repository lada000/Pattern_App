class CreateVirtualCards < ActiveRecord::Migration[7.1]
  def change
    create_table :virtual_cards do |t|
      t.string :card_number
      t.string :name
      t.decimal :balance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
