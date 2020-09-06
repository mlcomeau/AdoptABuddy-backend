class DropDecisions < ActiveRecord::Migration[6.0]
  def change
    drop_table :decisions
  end
end
