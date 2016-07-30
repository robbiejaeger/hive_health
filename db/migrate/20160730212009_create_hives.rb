class CreateHives < ActiveRecord::Migration[5.0]
  def change
    create_table :hives do |t|
      t.string :name
      t.text :description
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
