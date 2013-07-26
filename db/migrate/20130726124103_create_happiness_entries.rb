class CreateHappinessEntries < ActiveRecord::Migration
  def change
    create_table :happiness_entries do |t|
      t.integer :score
      t.text :description

      t.timestamps
    end
  end
end
