class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, :id => false do |t|
      t.references :group
      t.references :user
    end

    add_index :groups_users, [:group_id, :user_id],
      name: "groups_users_index",
      unique: true
  end
end
