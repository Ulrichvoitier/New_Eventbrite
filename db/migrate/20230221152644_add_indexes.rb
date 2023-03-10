class AddIndexes < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :user, foreign_key: true
    add_reference :attendances, :event, foreign_key: true
    add_reference :events, :admin, foreign_key: { to_table: :users }
  end
end
