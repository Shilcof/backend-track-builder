class CreateSegments < ActiveRecord::Migration[6.1]
  def change
    create_table :segments do |t|
      t.integer :position
      t.integer :segment_type
      t.belongs_to :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
