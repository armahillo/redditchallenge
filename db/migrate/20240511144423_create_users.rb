class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
