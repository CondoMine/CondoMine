
Feature: gerenciamento de condomino
  as a usuario do sistema
  I want to registrar, editar e remover um condomino
  So that eu mantenha o registro dos moradores do condominio atualizado

  Background:
    Given Eu estou logado como um usuario
    Given eu estou na pagina de gerenciamento de condomino

  Scenario: cadastrar condomino com nome vazio
    Given estou na pagina de cadastrar condomino
    When eu preencho nome '', cpf '12345678900', contato 'teste@gmail.com'
    And eu clico no botao create condomino
    Then vejo a mensagem "Nome can't be blank" informando que o nome nao pode ser vazio

  Scenario: cadastrar novo condomino corretamente
    Given estou na pagina de cadastrar condomino
    When eu preencho nome 'Rafael', cpf '12345678910', contato 'blablabla@blablabla.com'
    And eu clico no botao create condomino
    Then vejo a mensagem 'Condomino was successfully created.' confirmando que condomino foi cadastrado corretamente

  Scenario: Cadastrar novo condomino com cpf invalido
    Given estou na pagina de cadastrar condomino
    When eu preencho nome 'josue', cpf 'abc45678910', contato 'blablabla@blablabla.com'
    And eu clico no botao create condomino
    Then vejo a mensagem 'Cpf is not a number' informando que cpf e invalido

  Scenario: editar nome de condomino
    Given estou na pagina de editar cadastro de condomino
    When eu preencho nome 'eduardo', cpf '12345678900', contato 'teste@gmail.com'
    And eu clico no botao update Condomino
    Then vejo a mensagem 'Condomino was successfully updated.' indicando que o cadastro foi atualizado

  Scenario: apagar cadastro de condomino
    Given estou na pagina de visualizar condomino
    When eu clico no botao de excluir
    Then vejo a mensagem 'Condomino was successfully destroyed.' confirmando a exclusao
    And o condomino com nome 'lucas melo' não deve estar mais listado


