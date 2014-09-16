class AddColumnsToMyGirlfriends < ActiveRecord::Migration
  def change
    add_column :my_girlfriends, :number_she_texts, :string
    add_column :my_girlfriends, :is_current_girlfriend, :boolean
  end
end
