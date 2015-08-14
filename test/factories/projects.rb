# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  template    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| "Project %04d" % n }
    description "A description for this project"
    template    'rails'
  end
end
