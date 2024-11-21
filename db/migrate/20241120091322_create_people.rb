class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.date :birthday
      t.string :gender
      t.string :relationship
      t.text :encounter_story
      t.string :image_url

      t.timestamps
    end
  end
end
