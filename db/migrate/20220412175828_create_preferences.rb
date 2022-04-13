class CreatePreferences < ActiveRecord::Migration[7.0]
  def change
    create_table :preferences do |t|
      t.string :title

      t.timestamps
    end
    add_index :preferences, :title, unique: true
  end
end
