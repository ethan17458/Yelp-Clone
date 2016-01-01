class ChangeReviewedPlaceToString < ActiveRecord::Migration
  def up
  	change_column :reviews, :reviewed_place, :string
  end

  def down
  	change_column :reviews, :reviewed_place, :integer
  end
end
