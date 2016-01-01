class AddOwnerToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :owner, :integer
  end
end
