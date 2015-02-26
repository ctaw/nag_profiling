class CreateDepartments < ActiveRecord::Migration
  def change

    create_table :involvements do |t|
      t.integer :member_id
      t.datetime :date_joined
      t.integer :department_id
      t.integer :work_commitment_id
      t.timestamps
    end

    create_table :departments do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :work_commitments do |t|
      t.string :name
      t.text :description
    end
    
  end
end
