class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.text :notes
      t.references :hive, foreign_key: true

      t.timestamps
    end
  end
end
