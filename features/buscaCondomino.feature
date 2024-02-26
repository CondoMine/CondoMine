
Feature: Busca de condomino
    As a Usuario do sistema
    I want to buscar condominos informando nome ou CPF
    So that eu visualize o cadastro completo do condomino desejado

    Background:
        Given Eu estou logado como um usuario
        Given existem os condôminos "Marcos Silva" com cpf: "12345678875" e contato: "87981123456" e "Lucas da Silva" com cpf: "98765432109" e contato: "87981987654" no sistema
        And eu estou na pagina de busca do condomino

    Scenario: Buscando condomino inexistente pelo nome
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o nome 'Cleiton'
        And eu clico no botao de buscar
        Then vejo que a lista nao possui registros

    Scenario: Buscando condomino existente pelo cpf
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o cpf '12345678875'
        And eu clico no botao de buscar
        Then eu visualizo o registro esperado do Condomino 'Marcos Silva'

    Scenario: Buscando condomino pelo contato
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o contato '98765432109'
        And eu clico no botao de buscar
        Then eu visualizo o registro esperado do Condomino 'Lucas da Silva'

    Scenario: Buscando condomino existente pelo nome
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o nome 'Marcos Silva'
        And eu clico no botao de buscar
        Then eu visualizo o registro esperado do Condomino 'Marcos Silva'

    Scenario: Busca por nome parcial encontra múltiplos condôminos
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o nome 'Silva'
        And eu clico no botao de buscar
        Then O sistema exibe uma lista com todos os condôminos que contêm 'Silva' no nome
        And A lista contém mais de um condômino
