class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :instrument_id
      t.datetime :timestamp
      t.string :timestamps

      t.timestamps
    end
  end
end
