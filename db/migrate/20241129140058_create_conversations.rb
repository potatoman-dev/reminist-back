class CreateConversations < ActiveRecord::Migration[7.1]
  def change
    create_table :conversations do |t|
      t.references :person, null: false, foreign_key: true
      t.date :date, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
