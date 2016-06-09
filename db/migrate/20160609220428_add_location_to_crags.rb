class AddLocationToCrags < ActiveRecord::Migration
  def change
    add_column :crags, :location, :string
  end
end
