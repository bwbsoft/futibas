class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name, index: true
      t.string :uf, index: true
      t.string :city, index: true
      t.string :district, index: true
      t.string :address, index: true
      t.string :phone, index: true
      t.string :website, index: true
      t.string :instagram, index: true

      t.timestamps
    end

    add_index :places, [:name, :city], unique: true
  end
end
