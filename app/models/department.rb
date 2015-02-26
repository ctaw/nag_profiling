class Department < ActiveRecord::Base
  belongs_to :member
  has_many :involvements
end
