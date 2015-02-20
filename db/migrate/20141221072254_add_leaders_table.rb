class AddLeadersTable < ActiveRecord::Migration
  def change
    # Personal Information
    # add_column :users, :first_name, :string
    # add_column :users, :middle_name, :string
    # add_column :users, :last_name, :string
    # add_column :users, :name_extension, :string
    # add_column :users, :age, :integer
    # add_column :users, :birthdate, :datetime
    # add_column :users, :birthplace, :string
    # add_column :users, :address, :text
    # add_column :users, :civil_status, :integer
    # add_column :users, :occupation, :string
    # add_column :users, :date_accepted_christ, :datetime
    # add_column :users, :date_baptized_in_water, :datetime
    # add_column :users, :date_baptized_in_spirit, :datetime
    # add_column :users, :family_id, :integer

    # Family
    create_table :family_groups do |t|
      t.string :family_last_name
      t.integer :no_of_members
      t.timestamps
    end

    # Church Involvement
    create_table :church_involvement do |t|
      t.integer :member_id
      t.datetime :date_joined

      # Ministry or Department Involved 
      t.integer :children_ministry
      t.integer :christ_ambassadors
      t.integer :young_professional
      t.integer :men_ministry
      t.integer :women_ministry
      t.integer :music_ministry
      t.integer :pulpit_ministry
      t.integer :board_of_trustees
      t.integer :church_council

      # Work Commitment
      t.integer :church_staff
      t.integer :full_time
      t.integer :part_time
      t.integer :volunteer

      # Pastoral Staff
      t.integer :pastoral_staff
      t.integer :full_time
      t.integer :part_time
      t.integer :volunteer

      t.integer :campus_ministry
      t.integer :evangelism
      t.integer :discipleship
      t.integer :worship
      t.integer :fellowship
      t.integer :ministry
      t.integer :special

      t.timestamps
    end

    create_table :positions do |t|
      t.integer :member_id
      # Position
      t.integer :member
      t.integer :leader
      t.integer :senior_or_lead_pastor
      t.integer :executive_pastor
      t.integer :assistant_pastor
      t.integer :associate_pastor
      t.integer :adviser_or_overseer
      t.integer :church_secretary
      t.integer :church_treasurer
      t.integer :youth_pastor
      t.integer :worship_pastor
      t.integer :campus_pastor
      t.integer :small_group_pastor
      t.integer :children_pastor
      t.integer :children_superintendent
      t.integer :young_pro_pastor
      t.integer :mission_pastor
      t.integer :family_pastor
      t.integer :campus_ministry
      t.integer :deacon
      t.integer :president
      t.integer :vice_president
      t.integer :secretary 
      t.integer :treasurer 
      t.integer :auditor 
      t.integer :pro 

      # Membership Status
      t.integer :membership_status
      t.timestamps
    end

  end
end

