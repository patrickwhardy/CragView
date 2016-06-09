class CreatePanoramas < ActiveRecord::Migration
  def change
    create_table :panoramas do |t|
      t.string :location
      t.references :user, index: true, foreign_key: true
      t.string :thumbnail
    end
  end
end
