class CreateApiFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :api_features do |t|
      t.string :titulo
      t.string :url
      t.string :place
      t.string :id_feature
      t.string :magType
      t.string :coord_latitud
      t.string :coord_longitud
      t.string :coord_magnitud

      t.timestamps
    end
  end
end
