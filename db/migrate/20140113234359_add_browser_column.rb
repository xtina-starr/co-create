class AddBrowserColumn < ActiveRecord::Migration
  def change
    add_column :visitors, :browser, :string
  end
end
