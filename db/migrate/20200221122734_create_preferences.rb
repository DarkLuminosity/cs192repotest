class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.string :choice1
      t.string :choice2
      t.string :choice3

      t.timestamps
    end
  end
end
