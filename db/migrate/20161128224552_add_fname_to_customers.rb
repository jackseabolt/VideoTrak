class AddFnameToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :fname, :string
    add_column :customers, :lname, :string
    add_column :customers, :email, :string
    add_column :customers, :telephone, :string
  end
end
