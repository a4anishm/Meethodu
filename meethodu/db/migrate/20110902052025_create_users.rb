class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :email_id
      t.string :user_id, :unique=> true
      t.text :about_me
      t.text :interests
      t.date :date_of_birth
      t.string :area_code
      t.string :phone_number
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
