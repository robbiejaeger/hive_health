class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :token
      t.string :refresh_token
      t.string :expires_at

      t.timestamps
    end
  end
end
