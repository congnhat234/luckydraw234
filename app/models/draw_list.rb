class DrawList < ApplicationRecord
  has_many :draw_items, foreign_key: :draw_list_id, dependent: :destroy
end
