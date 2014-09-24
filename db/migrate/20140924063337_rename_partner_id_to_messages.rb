class RenamePartnerIdToMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :partner_id, :competition_id
  end
end
