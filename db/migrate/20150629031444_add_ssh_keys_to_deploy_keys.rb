class AddSshKeysToDeployKeys < ActiveRecord::Migration
  def change
    add_column :deploy_keys, :secret_key, :text
    add_column :deploy_keys, :public_key, :text
  end
end
