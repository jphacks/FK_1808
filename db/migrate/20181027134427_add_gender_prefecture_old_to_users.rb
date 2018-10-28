class AddGenderPrefectureOldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
    add_column :users, :prefecture, :string
    add_column :users, :age, :integer
    add_column :users, :description, :string
  end
end
