class AddAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :Admin, :boolean
  end
end
