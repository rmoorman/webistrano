# == Schema Information
#
# Table name: deployments
#
#  id                :integer          not null, primary key
#  task              :string(255)
#  log               :text
#  stage_id          :integer
#  created_at        :datetime
#  updated_at        :datetime
#  completed_at      :datetime
#  description       :text
#  user_id           :integer
#  excluded_host_ids :string(255)
#  revision          :string(255)
#  pid               :integer
#  status            :string(255)      default("running")
#

FactoryGirl.define do
  factory :deployment do
    stage { |a| a.association(:stage) }
    user  { |a| a.association(:user)  }
    sequence(:task)     { |n| "task-%04d" % n }
    sequence(:revision) { |n| "rev-%04d" % n }
    status   'running'
    prompt_config({})
    roles([])
    excluded_host_ids([])
    override_locking false
    description "A deployment description"
  end
end
