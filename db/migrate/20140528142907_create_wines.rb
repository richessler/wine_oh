class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.text :snooth_id
      t.string :region
      t.text :image_url
    end
  end
end
