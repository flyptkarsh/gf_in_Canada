class AddUserIdToMyGirlfriends < ActiveRecord::Migration
  def change
    add_reference :my_girlfriends, :user, index: true
  end
end
