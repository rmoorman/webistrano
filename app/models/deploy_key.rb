# == Schema Information
#
# Table name: deploy_keys
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  passphrase  :string(255)
#  private_key :text
#  public_key  :text
#  created_at  :datetime
#  updated_at  :datetime
#

class DeployKey < ActiveRecord::Base
  def insert_keys
    k = SSHKey.generate
    self.public_key = k.ssh_public_key
    self.private_key = k.private_key
    save
  end
end
