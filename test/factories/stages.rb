# == Schema Information
#
# Table name: stages
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  project_id              :integer
#  created_at              :datetime
#  updated_at              :datetime
#  alert_emails            :text
#  locked_by_deployment_id :integer
#  locked                  :integer          default(0)
#

FactoryGirl.define do
  factory :stage do
    sequence(:name) { |n| "Stage %04d" % n }
    project { |a| a.association(:project) }
  end
end
