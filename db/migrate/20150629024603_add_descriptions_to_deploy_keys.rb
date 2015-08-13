class AddDescriptionsToDeployKeys < ActiveRecord::Migration
  def change
    add_column :deploy_keys, :description, :text
  end
end
