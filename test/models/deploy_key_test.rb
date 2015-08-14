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

require 'test_helper'

class DeployKeyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
