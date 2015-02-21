class CreateMembersTable < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :name_extension
      t.integer :age
      t.datetime :birthdate
      t.string :birthplace
      t.text :address
      t.integer :civil_status
      t.string :occupation
      t.string :email
      t.datetime :date_accepted_christ
      t.datetime :date_baptized_in_water
      t.datetime :date_baptized_in_spirit
      t.integer :family_id
      t.integer :relationship_id
      t.integer :position_id
      t.integer :status #membership status
      t.timestamps
    end
  end
end
