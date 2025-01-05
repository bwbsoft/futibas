class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :description
      t.timestamps
    end
  end
end
