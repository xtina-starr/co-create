class AddCountryColumn < ActiveRecord::Migration
  def change
    add_column :visitors, :country, :string
  end
end
