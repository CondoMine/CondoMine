class CreateCondominos < ActiveRecord::Migration[7.0]
  def change
    create_table :condominos do |t|
      t.string :nome
      t.string :cpf
      t.string :contato

      t.references :funcionario, null: false, foreing_keys: true

      t.timestamps
    end
  end
end
