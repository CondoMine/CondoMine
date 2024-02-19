require "test_helper"

class AmbienteTest < ActiveSupport::TestCase
  test "Tentar salvar um ambiente sem nome e sem o tipo" do
    ambiente = Ambiente.new
    assert_not ambiente.save
  end

  test "Tentar salvar o ambiente sem o tipo" do
    ambiente = Ambiente.new(nome: "Piscina")
    assert_not ambiente.save
  end

  test "Tentar salvar nome com numeros" do
    ambiente = Ambiente.new(nome: "123456")
    assert_not ambiente.save
  end

  test "salvar ambiente corretamente" do
    ambiente = Ambiente.new(nome: "Quadra", tipo: "Poliesportiva")
    assert ambiente.save
  end
end
