class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.datetime :start
      t.string :url
      t.boolean :book, default: false

      t.timestamps
    end
  end
end
