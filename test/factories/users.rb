# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  login                  :string(255)
#  time_zone              :string(255)      default("UTC")
#  disabled_at            :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :user do
    sequence(:login) { |n| "user_%04d" % n }
    sequence(:email) { |n| "user_%04d@example.com" % n }
    admin       false
    password    'hello!'
    password_confirmation { |a| a.password }
  end
end
