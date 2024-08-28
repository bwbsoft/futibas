class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      
      t.string :phone, index: true
      t.string :instagram, index: true
      t.string :picture

      t.string :cpf, index: { unique: true }

      t.timestamps
    end
  end
end
