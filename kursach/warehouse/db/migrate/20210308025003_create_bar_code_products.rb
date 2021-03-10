class CreateBarCodeProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :bar_code_products do |t|
      t.string :code_p
      t.string :title

      t.timestamps
    end
    add_index :bar_code_products, :code_p, unique: true
  end
end
