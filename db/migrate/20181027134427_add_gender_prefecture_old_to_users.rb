class AddGenderPrefectureOldToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
    add_column :users, :prefecture, :string
    add_column :users, :old, :integer
  end
end
