class AddPhoneNumberAndNameToRegistration < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :phone_number, :integer
  end

  def self.down
    remove_column :users, :phone_number
    remove_column :users, :name
  end
end
