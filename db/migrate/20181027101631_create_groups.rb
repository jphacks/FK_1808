class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.datetime :start
      t.string :url
      t.boolean :book, default: false
      t.string :prefecture

      t.timestamps
    end
  end
end
