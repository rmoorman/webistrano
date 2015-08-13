class CreateDeployKeys < ActiveRecord::Migration
  def change
    create_table :deploy_keys do |t|
      t.string :name
      t.text :secret
      t.text :public
      t.string :passphrase

      t.timestamps
    end
  end
end
