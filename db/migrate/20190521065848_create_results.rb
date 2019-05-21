class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.text :before
      t.text :after

      t.timestamps
    end
  end
end
