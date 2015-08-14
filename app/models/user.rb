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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :registerable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deployments, -> { order 'created_at DESC' }, :dependent => :nullify

  validates :login, :presence => true, :uniqueness => {:case_sensitive => false}, :length => {:within => 3..40}
  validate :guard_last_admin, :on => :update

  scope :enabled,  -> { where(:disabled_at => nil) }
  scope :disabled, -> { where("disabled_at IS NOT NULL") }
  scope :admins,   -> { where(:admin => true, :disabled_at => nil) }

  def name
    login
  end

  def revoke_admin!
    self.admin = false
    self.save!
  end

  def make_admin!
    self.admin = true
    self.save!
  end

  def disabled?
    self.disabled_at.present?
  end

  def disable!
    self.update_column(:disabled_at, Time.now)
    self.forget_me!
  end

  def enable!
    self.update_column(:disabled_at, nil)
  end

private

  def guard_last_admin
    if User.find(self.id).admin? && !self.admin?
      if User.admins.count == 1
        errors.add('admin', 'status can no be revoked as there needs to be one admin left.')
      end
    end
  end

end
