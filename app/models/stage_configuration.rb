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

class StageConfiguration < ConfigurationParameter
  belongs_to :stage
  
  validates :stage, :presence => true
  validates :name, :uniqueness => {:scope => :stage_id}
end
