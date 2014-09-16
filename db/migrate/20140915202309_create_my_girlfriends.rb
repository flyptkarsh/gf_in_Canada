class CreateMyGirlfriends < ActiveRecord::Migration
  def change
    create_table :my_girlfriends do |t|
      t.string :name
      t.string :hometown
      t.string :favorite_food
      t.string :where_we_met
      t.text :what_turns_me_on

      t.timestamps
    end
  end
end
