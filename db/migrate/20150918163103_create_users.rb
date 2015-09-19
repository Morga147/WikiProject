class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :home_language
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
