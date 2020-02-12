class ChangePasswordField < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      rename_column :users, :password, :password_digest
    end
  end
end
