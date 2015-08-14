# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Recipe %04d" % n }
    description "A description for this recipe"
    body        '# a recipe'
  end
end
