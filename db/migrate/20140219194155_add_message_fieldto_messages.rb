class AddMessageFieldtoMessages < ActiveRecord::Migration
  def change
    add_column :messages, :message_text, :text
  end
end
