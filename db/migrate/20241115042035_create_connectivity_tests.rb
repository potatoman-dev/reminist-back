class CreateConnectivityTests < ActiveRecord::Migration[7.1]
  def change
    create_table :connectivity_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
