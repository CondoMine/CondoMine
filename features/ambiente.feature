Feature: gerenciamento de ambiente
  as a usuario do sistema
  i want to registrar, editar e remover um ambiente
  so that eu mantenha as amenidades do condominio atualizadas

  Scenario: cadastrar ambiente com nome vazio
    Given estou na pagina de cadastrar ambiente
    When eu preencho nome '', tipo 'area comum'
    And eu clico no botao create ambiente
    Then vejo a mensagem "Nome can't be blank", "can't have numbers" e "Nome is too short (minimum is 3 characters)" o nome nao deve ser vazio, nao dever conter numeros e deve possuir pelo menos tres caracteres

  Scenario: cadastrar tipo com nome vazio
    Given estou na pagina de cadastrar ambiente
    When eu preencho nome 'piscina', tipo ''
    And eu clico no botao create ambiente
    Then vejo a mensagem "Tipo can't be blank", "Tipo can't have numbers" e "Tipo is too short (minimum is 5 characters)" o campo tipo nao deve ser vazio, nao deve conter numeros e deve possuir pelo menos cinco caracteres

  Scenario: atualizar ambiente com o campo tipo vazio
    Given estou na pagina de editar ambiente
    When eu preencho nome 'Piscina', tipo ''
    And eu clico no botao update ambiente
    Then vejo a mensagem "Tipo can't be blank", "Tipo can't have numbers" e "Tipo is too short (minimum is 5 characters)" o campo tipo nao deve ser salvo com o nome vazio

  Scenario: deletar ambiente
    Given estou na pagina de visualizar ambiente
    When eu clico no botao destroy this ambiente
    Then a mensagem "Ambiente was successfully destroyed." deve aparecer

  Scenario: atualizar ambiente
    Given estou na pagina de editar ambiente
    When eu preencho nome 'Piscina', tipo 'Area privada'
    And eu clico no botao update ambiente
    Then a mensagem "Ambiente was successfully updated." deve aparecer indicando que o ambiente foi atualizada com sucesso





