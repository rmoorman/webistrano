# == Schema Information
#
# Table name: hosts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Host < ActiveRecord::Base
  has_many :roles, -> { uniq }, :dependent => :destroy
  has_many :stages, -> { uniq }, :through => :roles # XXX uniq does not seem to work! You get all stages, even doubles
  
  validates :name, :uniqueness => true, :presence => true, :length => {:maximum => 250}
  validate :guard_valid_hostname_or_ip
  
  before_validation :strip_whitespace
 
private

  def guard_valid_hostname_or_ip
    errors.add("name", "is not a valid hostname or IP") unless ( valid_ip? || valid_hostname? )
  end

  def strip_whitespace
    self.name = self.name.strip if self.name
  end
   
  def valid_hostname?
    self.name =~ /\A[a-zA-Z0-9\_\-\.]+\Z/
  end
  
  def valid_ip?
    if self.name =~ /^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$/
      ($1.to_i <= 255) && ($2.to_i <= 255) && ($3.to_i <= 255) && ($4.to_i <= 255)
    else
      false
    end
  end
  
end
