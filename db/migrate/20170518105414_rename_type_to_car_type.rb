class RenameTypeToCarType < ActiveRecord::Migration[5.0]
  def change
    rename_column :cars, :type, :car_type
  end
end
