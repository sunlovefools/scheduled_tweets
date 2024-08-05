class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,  null: false #A protection in db to make sure that the data input must be something
      t.string :password_digest

      t.timestamps
    end
  end
end
