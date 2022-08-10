class RemoveAvaterFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avater, :string
  end
end
