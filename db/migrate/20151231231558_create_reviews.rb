class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :reviewed_place
      t.text :content
      t.integer :stars

      t.timestamps null: false
    end
  end
end
