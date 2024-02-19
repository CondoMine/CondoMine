class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :nome
      t.string :estado
      t.string :tipo
      t.date :data_entrada
      t.references :ambiente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
