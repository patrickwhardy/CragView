class AddCragRefToPanoramas < ActiveRecord::Migration
  def change
    add_reference :panoramas, :crag, index: true, foreign_key: true
  end
end
