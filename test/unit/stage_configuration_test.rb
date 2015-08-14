# == Schema Information
#
# Table name: configuration_parameters
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  value            :string(255)
#  project_id       :integer
#  stage_id         :integer
#  type             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  prompt_on_deploy :integer          default(0)
#

require 'test_helper'

class StageConfigurationTest < ActiveSupport::TestCase
  
  test "uniqiness_of_name" do
    p = FactoryGirl.create(:project)
    s = FactoryGirl.create(:stage, :project => p)
    
    # create a new parameter by hand
    config = s.configuration_parameters.build(:name => 'bla_bla', :value => 'blub_blub')
    config.save!
    
    # try to create 
    config = s.configuration_parameters.build(:name => 'bla_bla', :value => 'MAMA_MIA')
    assert !config.valid?
    assert_not_empty config.errors['name']
  end
  
end
