# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  stage_id   :integer
#  host_id    :integer
#  primary    :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#  no_release :integer          default(0)
#  ssh_port   :integer
#  no_symlink :integer          default(0)
#

FactoryGirl.define do
  factory :role do
    sequence(:name) { |n| "Role %04d" % n }
    stage       { |a| a.association(:stage) }
    host        { |a| a.association(:host) }
    primary     0
    no_release  0
    no_symlink  0
  end
end
