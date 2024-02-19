require "test_helper"

class CondominoTest < ActiveSupport::TestCase

  test "Tentando salvar condomino sem nome" do
    condomino = Condomino.new
    assert_not condomino.save
  end

  test "Tentando salvar condomino sem CPF" do
    condomino = Condomino.new(nome: "lucas melo") 
    assert_not condomino.save
  end

  test "Tentando salvar condomino com nome com menos caracteres do que o permitido" do
    condomino = Condomino.new(nome: "loi") 
    assert_not condomino.save
  end

end
