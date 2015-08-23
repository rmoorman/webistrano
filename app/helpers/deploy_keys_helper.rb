module DeployKeysHelper
  def sshkey_generate_check(deploy_key)
    !(deploy_key.private_key? || deploy_key.public_key?)
  end
end
