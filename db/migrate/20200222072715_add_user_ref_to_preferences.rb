class AddUserRefToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :preferences, :user, foreign_key: true
  end
end
