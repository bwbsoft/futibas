class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name, null: false
      t.string :notes
      t.string :picture
      
      t.string :discord_webhook_url

      t.references :owner, null: false, foreign_key: { to_table: :users }, type: :uuid

      t.timestamps
    end
  end
end
