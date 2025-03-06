class AddCoordinatesToAppliances< ActiveRecord::Migration[7.1]
  def change
    add_column :appliances, :latitude, :float
    add_column :appliances, :longitude, :float
    add_column :appliances, :address, :string
  end
end
