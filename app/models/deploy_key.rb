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
  validate :correct_private_key

  def update_keys(ssh_key)
    self.public_key  = ssh_key.ssh_public_key
    self.private_key = ssh_key.private_key

    save
  end
  def insert_keys(params, generate_option: nil)
    if params.blank? || params[:private_key].blank?
      if generate_option.blank?
        k = SSHKey.generate(
          comment: "deploy@webistrano_generated"
        )
      else
        k = SSHKey.generate generate_option
      end
      update_keys k
    else
      begin
        update_keys SSHKey.new params[:private_key]
      rescue
      end
    end
  end

  private

  def correct_private_key
    begin
      SSHKey.new private_key
    rescue => ex
      errors.add(:private_key, ex.message)
    end
  end
end
