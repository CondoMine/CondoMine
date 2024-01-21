class CreateCondominios < ActiveRecord::Migration[7.0]
  def change
    create_table :condominios do |t|
      t.string :nome
      t.string :cnpj

      t.timestamps
    end
  end
end
