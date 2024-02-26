

Feature: gerenciamento de itens do ambiente de ambiente
  As a usuario do sistema
  I want to registrar, editar e remover itens para ambientes existentes
  So that eu mantenha patrimonio do condominio atualizado

  Background:
    Given Eu estou logado como um usuario
    Given existe um Ambiente com nome "Quadra", tipo "Poliesportiva" no sistema
    And  estou na pagina de gerenciamento de item

  Scenario: criar item
    Given estou na pagina de cadastrar item
    When eu preencho nome 'Cadeira', estado 'Seminovo', tipo 'Movel'
    And seleciono o ambiente 'Quadra'
    And eu preencho a data entrada '2024-01-01'
    And eu clico no botao Create Item
    Then eu vejo a mensagem 'Item was successfully created.' de que o item foi criado com sucesso

  Scenario: criar item sem data e sem ambiente selecionado
    Given estou na pagina de cadastrar item
    When eu preencho nome 'Cadeira', estado 'Seminovo', tipo 'Movel'
    And eu clico no botao Create Item
    Then vejo a mensagem "Ambiente must exist" e "Data entrada deve ser fornecida" de que se deve ter um ambiente selecionado e que a data de entrada deve ser fornecida

  Scenario: criar item sem preencher nenhum campo
    Given estou na pagina de cadastrar item
    When eu clico no botao Create Item sem preencher nenhum campo
    Then vejo mensagens de erro indicando que todos os campos sao obrigatorios

  Scenario: editar nome de um item
    Given estou na pagina de editar item
    When eu mudo o nome do item para 'guarda-chuva'
    And eu clico no botao Update Item
    Then eu vejo a mensagem "Item was successfully updated." de que o item foi atualizado com sucesso

  Scenario: atualizar item sem preencher o campo tipo
    Given estou na pagina de editar item
    When eu mudo o tipo do item para ''
    And eu clico no botao Update Item
    Then vejo a mensagem "Tipo can't be blank", "Tipo can't have numbers" e "Tipo is too short (minimum is 3 characters)" que o campo nao deve ser vazio, nao pode apresentar numeros e que deve conter pelo menos 3 caracteres
