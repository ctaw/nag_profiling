class AddNameToFamilyGroups < ActiveRecord::Migration
  def change
    add_column :family_groups, :name, :string
  end
end
