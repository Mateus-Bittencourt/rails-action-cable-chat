class AddVonageSessionIdToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :vonage_session_id, :string
  end
end
