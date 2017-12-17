class CreateThings < ActiveRecord::Migration[5.1]
  def change
    create_table :things do |t|
      t.string :name
      t.string :image_url
    end
  end
end
