class AddMoreColumnsToAppliances < ActiveRecord::Migration[7.1]
  def change
    add_column :appliances, :capacity, :integer
    add_column :appliances, :city, :string
    add_column :appliances, :photo_url, :string
  end
end
