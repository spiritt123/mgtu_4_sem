class CreateBarCodeCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :bar_code_companies do |t|
      t.string :code_co
      t.string :title

      t.timestamps
    end
    add_index :bar_code_companies, :code_co, unique: true
  end
end
