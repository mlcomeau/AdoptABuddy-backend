class ChangeSearchRadiusToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :search_radius, 'integer USING CAST(search_radius AS integer)'
  end
end
