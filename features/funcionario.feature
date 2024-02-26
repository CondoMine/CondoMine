
Feature: Gerenciamento de funcionario
  As a Usuario do sistema
  I want to registrar, editar e remover um funcionario
  So that eu mantenha o registro dos funcionarios do condominio atualizado

  Background:
    Given  Eu estou logado como um usuario
    Given estou na pagina de gerenciamento de funcionario

  Scenario: cadastrar funcionario com nome vazio
    Given estou na pagina de cadastrar funcionario
    When eu preencho nome '', cpf '12345678900', funcao 'administrador'
    And eu clico no botao create funcionario
    Then vejo a mensagem "Nome can't be blank" informando que o nome nao pode ser vazio

  Scenario: cadastrar novo funcionario corretamente
    Given estou na pagina de cadastrar funcionario
    When eu preencho nome 'Rafael', cpf '12345678910', funcao 'gerente'
    And eu clico no botao create funcionario
    Then vejo a mensagem 'Funcionario was successfully created.' confirmando que o funcionario foi cadastrado corretamente

  Scenario: Cadastrar novo funcionario com cpf invalido
    Given estou na pagina de cadastrar funcionario
    When eu preencho nome 'josue', cpf 'abc45678910', funcao 'rondante'
    And eu clico no botao create funcionario
    Then vejo a mensagem 'Cpf deve ter 11 dígitos numéricos' informando que cpf e invalido

  Scenario: editar nome de funcionario
    Given estou na pagina de editar cadastro de funcionario
    When eu preencho nome 'eduardo', cpf '12345678910', funcionario 'gerente'
    And eu clico no botao update Funcionario
    Then vejo a mensagem 'Funcionario was successfully updated.' indicando que o cadastro foi atualizado

  Scenario: apagar cadastro de funcionario
    Given estou na pagina de visualizar funcionario
    When eu clico no botao "Destroy this funcionario"
    Then vejo a mensagem 'Funcionario was successfully destroyed.' confirmando a exclusao
    And o funcionario com nome 'eduardo' não deve estar mais listado