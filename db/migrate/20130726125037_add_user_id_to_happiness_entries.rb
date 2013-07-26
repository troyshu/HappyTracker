class AddUserIdToHappinessEntries < ActiveRecord::Migration
  def change
  	add_column :happiness_entries, :user_id, :integer
  end
end
