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
      t.integer :deparment_id
      t.integer :work_commitment_id
      t.timestamps
    end

    create_table :positions do |t|
      # Position
      t.string :name 
      t.text :description
      t.timestamps
    end

  end
end

