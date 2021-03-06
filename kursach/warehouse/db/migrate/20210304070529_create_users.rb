class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.integer :rights
      t.string :iduser
      t.string :password_digest

      t.timestamps
    end
    #add_index :iduser, unique: true
  end
end
