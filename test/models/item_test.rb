require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "Salvando corretamente com todos parametros" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: "Cadeira", estado: "Nova", tipo: "Movel", data_entrada: "2024-01-03" , ambiente: ambiente,   )
    assert item.save
  end

  test "Tentando salvar Item sem estado" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: "ar-condicionado", estado: nil, tipo: "Movel", data_entrada: "2024-01-03" , ambiente: ambiente,   )
    assert_not item.save
  end

  test "Tentando salvar Item com data de entrada no futuro" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: "ar-condicionado", estado: "Novo", tipo: "Movel", data_entrada: "2024-04-30" , ambiente: ambiente,   )
    assert_not item.save
  end

  test "Tentando salvar Item sem data" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: "ar-condicionado", estado: "Novo", tipo: "Movel", data_entrada: nil , ambiente: ambiente,   )
    assert_not item.save
  end

  test "Tentando salvar Item com nome de tamanho insuficiente" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: "ar", estado: "Nova", tipo: "Movel", data_entrada: "2024-01-03" , ambiente: ambiente,   )
    assert_not item.save
  end

  test "Tentando salvar Item sem nome" do
    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    item = Item.new( nome: nil, estado: "Nova", tipo: "Movel", data_entrada: "2024-01-03" , ambiente: ambiente,   )
    assert_not item.save
  end

  test "Tentando salvar item sem Ambiente" do

    item = Item.new( nome: "Cadeira", estado: "Nova", tipo: "Movel", data_entrada: "2024-01-03" , ambiente: nil,   )
    assert_not item.save
  end
end
