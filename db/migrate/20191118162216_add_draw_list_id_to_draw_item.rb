class AddDrawListIdToDrawItem < ActiveRecord::Migration[5.1]
  def change
    add_column :draw_items, :draw_list_id, :bigint, default: 1
  end
end
