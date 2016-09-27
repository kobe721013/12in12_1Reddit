class RenameNicknameToNickname < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :Nickname, :nickname
  end
end
