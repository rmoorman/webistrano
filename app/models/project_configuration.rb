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

class ProjectConfiguration < ConfigurationParameter
  belongs_to :project
  
  validates :project, :presence => true
  validates :name, :uniqueness => {:scope => :project_id}
  
  # default templates for Projects
  def self.templates
    {
      'rails' => Webistrano::Template::Rails,
      'mongrel_rails' => Webistrano::Template::MongrelRails,
      'thin_rails' => Webistrano::Template::ThinRails,   
      'mod_rails' => Webistrano::Template::ModRails,
      'pure_file' => Webistrano::Template::PureFile,
      'unicorn' => Webistrano::Template::Unicorn
    }
  end
  
end
