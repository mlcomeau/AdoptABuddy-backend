class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.references :user
      t.string :animal
      t.string :gender
      t.string :age 
      t.string :size  

      t.timestamps
    end
  end
end
