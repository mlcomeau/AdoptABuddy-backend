class CreateDecisions < ActiveRecord::Migration[6.0]
  def change
    create_table :decisions do |t|
      t.references :user 
      t.string :pet_id
      t.string :result 

      t.timestamps
    end
  end
end
