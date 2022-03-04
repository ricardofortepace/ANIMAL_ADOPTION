class ChangeAddressModel < ActiveRecord::Migration[6.1]
  def change
    remove_column :adoptions, :address
    add_column :users, :address, :string
  end
end
