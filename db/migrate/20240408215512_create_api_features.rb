class CreateApiFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :api_features do |t|
      t.string :tipo
      t.string :titulo
      t.string :url
      t.string :place
      t.string :id_feature
      t.string :mag_type
      t.decimal :coord_latitud
      t.decimal :coord_longitud
      t.decimal :magnitud
      t.text :comment, array: true, default: [] 
      t.string :time
      t.boolean :tsunami

      t.timestamps
    end
  end
end
