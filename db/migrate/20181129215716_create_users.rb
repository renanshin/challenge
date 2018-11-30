class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf, :limit => 11

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email
    add_index :users, :cpf, unique: true
  end
end
