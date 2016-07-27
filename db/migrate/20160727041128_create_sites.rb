class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :longitude
      t.string :latitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
