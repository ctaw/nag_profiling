class FamilyGroup < ActiveRecord::Base

  def full_name
    self.family_last_name+" "+self.name
  end

end