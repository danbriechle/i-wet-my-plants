class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :zip_code
      t.string :oauth_token
      t.string :uid

      t.timestamps
    end
  end
end
