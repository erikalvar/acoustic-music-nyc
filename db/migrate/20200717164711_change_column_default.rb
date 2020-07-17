class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :moderator, false
  end
end
