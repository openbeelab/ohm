class TableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users
    add_column :users, :username, :string, unique: true
    add_column :users, :email, :string, unique: true
    add_column :users, :enabled, :boolean
    add_column :users, :password, :string
    add_column :users, :last_login, :datetime
    add_column :users, :locked, :boolean
    add_column :users, :expired, :boolean
    add_column :users, :expires_at, :datetime
    add_column :users, :confirmation_token, :string
  end
end
