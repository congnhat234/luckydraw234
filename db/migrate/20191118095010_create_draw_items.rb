class CreateDrawItems < ActiveRecord::Migration[5.1]
  def change
    create_table :draw_items do |t|
      t.string :fullname
      t.string :shortname

      t.timestamps
    end
  end
end
