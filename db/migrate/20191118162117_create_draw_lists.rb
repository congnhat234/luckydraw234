class CreateDrawLists < ActiveRecord::Migration[5.1]
  def change
    create_table :draw_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
