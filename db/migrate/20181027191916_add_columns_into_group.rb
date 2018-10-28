class AddColumnsIntoGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :store_name, :string
    add_column :groups, :location, :string
  end
end
