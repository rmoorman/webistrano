# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :host do
    sequence(:name) { |n| "%04d.example.com" % n }
  end
end
