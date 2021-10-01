class CreateInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :instruments do |t|
      t.string :symbol

      t.timestamps
    end
  end
end
