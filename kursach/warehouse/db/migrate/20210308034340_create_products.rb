class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :id_p
      t.string :title
      t.string :barcode
      t.integer :massa
      t.string :production
      t.string :expiration

      t.timestamps
    end
    add_index :products, :id_p, unique: true
  end
end
