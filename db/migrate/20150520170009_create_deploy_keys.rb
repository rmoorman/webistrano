class CreateDeployKeys < ActiveRecord::Migration
  def change
    create_table :deploy_keys do |t|
      t.string :name
      t.string :description
      t.string :passphrase
      t.text :private_key
      t.text :public_key

      t.timestamps
    end
  end
end
