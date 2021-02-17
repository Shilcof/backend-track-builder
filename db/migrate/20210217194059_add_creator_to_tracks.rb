class AddCreatorToTracks < ActiveRecord::Migration[6.1]
  def change
    add_column :tracks, :creator, :string
  end
end
