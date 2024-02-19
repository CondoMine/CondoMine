Feature: Reservar ambiente
  As a Condomino do condominio
  I want to reservar um ambiente em horario e data especificos
  So that eu possa usar o ambiente de forma privada

  Background:
    Given estou na pagina de cadastro de reserva
    When existe um Condomino com o nome "Marcos Teste", cpf "12345678875", contato "marcosteste@teste.com" no sistema
    And existe um Ambiente com nome "Quadra", tipo "Poliesportiva" no sistema de reservas


  Scenario: fazer uma nova reserva
    Given estou na pagina de cadastro de reserva
    When seleciono o condomino "Marcos Teste" da lista de condominos
    And seleciono o ambiente "Quadra" da lista de ambientes
    And preencho a data inicial "2024-03-10", data final "2024-04-20", hora inicial "09:00" e hora final "13:00"
    And eu clico no botao "Create Reserva"
    Then eu vejo a mensagem de sucesso 'Reserva was successfully created.'

  Scenario: cadastrar uma reserva sem um condomino
    Given estou na pagina de cadastro de reserva
    When nao seleciono condomino da lista de condominos
    And seleciono o ambiente "Quadra" da lista de ambientes
    And preencho a data inicial "2024-04-21", data final "2024-04-29", hora inicial "06:00" e hora final "08:00"
    And eu clico no botao "Create Reserva"
    Then eu vejo a mensagem de erro 'Condomino must exist'

  Scenario: tentar fazer uma reserva sem o ambiente
    Given estou na pagina de cadastro de reserva
    When seleciono o condomino "Marcos Teste" da lista de condominos
    And nao seleciono ambiente da lista de ambientes
    And preencho a data inicial "2025-01-01", data final "2024-01-02", hora inicial "10:00" e hora final "16:00"
    And eu clico no botao "Create Reserva"
    Then eu vejo a mensagem de erro "Ambiente must exist"

  Scenario: editar uma reserva
    Given estou na pagina de editar uma reserva
    When eu modofico a data inicial "2024-03-10", data final "2024-04-15", hora inicial "09:00" e hora final "13:00"
    And eu clico no botao "Update Reserva"
    Then eu vejo a mensagem de sucesso 'Reserva was successfully updated'

  Scenario: tentar fazer uma reserva sem data
    Given estou na pagina de cadastro de reserva
    When seleciono o condomino "Marcos Teste" da lista de condominos
    And seleciono o ambiente "Quadra" da lista de ambientes
    And preencho a data inicial " ", data final "2024-06-05", hora inicial "12:00" e hora final "17:00"
    And eu clico no botao "Create Reserva"
    Then eu vejo a mensagem de erro "Data ini A data de início deve ser fornecida"
