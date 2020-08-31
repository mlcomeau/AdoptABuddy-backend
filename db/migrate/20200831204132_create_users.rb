class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :zipcode
      t.string :search_radius
      t.datetime :date_of_last_search, default: null

      t.timestamps
    end
  end
end
