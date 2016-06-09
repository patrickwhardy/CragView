class CreateCrags < ActiveRecord::Migration
  def change
    create_table :crags do |t|
      t.string :name
      t.string :description
      t.string :directions
    end
  end
end
