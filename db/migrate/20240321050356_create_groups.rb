class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :notes
      t.string :picture
      
      t.string :discord_webhook_url

      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
