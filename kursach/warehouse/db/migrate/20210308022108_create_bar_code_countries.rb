class CreateBarCodeCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :bar_code_countries do |t|
      t.string :code_c
      t.string :title

      t.timestamps
    end
    add_index :bar_code_countries, :code_c, unique: true
  end
end
