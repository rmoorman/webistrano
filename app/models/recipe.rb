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

class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :stages
  
  validates :name, :uniqueness => true, :presence => true, :length => {:maximum => 250}
  validates :body, :presence => true
  validate :check_syntax
  
  scope :ordered, :order => "name ASC"
  
  has_paper_trail
 
private

  def check_syntax
   return if self.body.blank?

   result = ""
   Open4::popen4 "ruby -wc" do |pid, stdin, stdout, stderr|
     stdin.write body
     stdin.close
     output = stdout.read
     errors = stderr.read
     result = output.empty? ? errors : output
   end
   
   unless result == "Syntax OK"
     line = $1.to_i if result =~ /^-:(\d+):/
     errors.add(:body, "syntax error at line: #{line}") unless line.nil?
   end
  rescue => e
    Rails.logger.error "Error while validating recipe syntax of recipe #{self.id}: #{e.inspect} - #{e.backtrace.join("\n")}"
  end
 
end
