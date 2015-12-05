class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :persistence_token, :null => false
      t.string :api_token, :null => false

      t.timestamps null: false
    end
  end
end
