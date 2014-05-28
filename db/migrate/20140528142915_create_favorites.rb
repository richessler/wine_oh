class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :wine
      t.references :user
      t.integer :rating, default: 0
    end
  end
end
