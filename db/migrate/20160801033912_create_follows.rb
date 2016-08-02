class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
