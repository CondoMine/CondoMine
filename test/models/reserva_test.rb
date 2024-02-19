require "test_helper"

class ReservaTest < ActiveSupport::TestCase

  test "Tentando salvar uma reserva sem data de início" do
    condomino = Condomino.new(nome: "Andre", cpf: "12365489765", contato: "81987564213" )
    assert condomino.save

    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    reserva = Reserva.new(condomino: condomino, ambiente: ambiente, data_ini: nil,  data_fim: "2024-01-03", hora_ini: "08:00", hora_fim: "14:00" )
    assert_not reserva.save
  end

  test "Tentando salvar uma reserva sem data de término" do
    condomino = Condomino.new(nome: "Andre", cpf: "12365489765", contato: "81987564213" )
    assert condomino.save

    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    reserva = Reserva.new(condomino: condomino, ambiente: ambiente, data_ini: "2024-01-01", data_fim: nil, hora_ini: "08:00", hora_fim: "14:00" )
    assert_not reserva.save
  end

  test "Tentando salvar uma reserva sem hora de início" do
    condomino = Condomino.new(nome: "Andre", cpf: "12365489765", contato: "81987564213" )
    assert condomino.save

    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    reserva = Reserva.new(condomino: condomino, ambiente: ambiente, data_ini: "2024-01-01", data_fim: "2024-01-03", hora_ini: nil, hora_fim: "14:00" )
    assert_not reserva.save
  end

  test "Tentando salvar uma reserva sem hora de término" do
    condomino = Condomino.new(nome: "Andre", cpf: "12365489765", contato: "81987564213" )
    assert condomino.save

    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    reserva = Reserva.new(condomino: condomino, ambiente: ambiente, data_ini: "2024-01-01", data_fim: "2024-01-03", hora_ini: "10:00", hora_fim: nil)
    assert_not reserva.save
  end

  test "Tentando salvar uma reserva com data de início após a data de término" do
    condomino = Condomino.new(nome: "Andre", cpf: "12365489765", contato: "81987564213" )
    assert condomino.save

    ambiente = Ambiente.new(nome: "Piscina", tipo: "Area privada")
    assert ambiente.save

    reserva = Reserva.new(condomino: condomino, ambiente: ambiente, data_ini: "2025-01-01", data_fim: "2024-01-03", hora_ini: "10:00", hora_fim: "16:00")
    assert_not reserva.save

  end
end
