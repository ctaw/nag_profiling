class Member < ActiveRecord::Base
  
  has_many :involvements
  has_many :positions
  has_many :departments

  def get_status
    self.status == 1 ? "Active" : "Inactive"
  end

  def get_civil_status
    
    if self.civil_status == 0
      "Single"
    elsif self.civil_status == 1
      "Married"
    elsif self.civil_status == 2
      "Widowed"
    elsif self.civil_status == 3
      "Divorced"
    else
      ""
    end
  end

end