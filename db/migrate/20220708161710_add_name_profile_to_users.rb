class AddNameProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_profile, :text
  end
end
