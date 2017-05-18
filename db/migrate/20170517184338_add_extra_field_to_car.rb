class AddExtraFieldToCar < ActiveRecord::Migration[5.0]
  def change
    add_reference :cars, :user, foreign_key: true
  end
end
