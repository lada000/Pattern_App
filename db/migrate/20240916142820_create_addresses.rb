class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :street
      t.string :house
      t.string :apartment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
