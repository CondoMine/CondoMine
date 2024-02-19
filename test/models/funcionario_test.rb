require "test_helper"

class FuncionarioTest < ActiveSupport::TestCase

  test "Tentando salvar funcionario sem nome" do
    funcionario = Funcionario.new
    assert_not funcionario.save
  end

  test "Tentando salvar funcionario sem CPF" do
    funcionario = Funcionario.new(nome: "Rafael")
    assert_not funcionario.save
  end

  test "Tentando salvar funcionario com nome com menos caracteres do que o permitido" do
    funcionario = Funcionario.new(nome: "Leo")
    assert_not funcionario.save
  end

end
