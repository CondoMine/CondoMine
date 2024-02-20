Feature: Busca de condomino
    As a Usuario do sistema
    I want to buscar condominos informando nome ou CPF
    So that eu visualize o cadastro completo do condomino desejado

    Scenario: Buscando condomino inexistente pelo nome
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o nome 'lucas'
        And eu clico no botao de buscar
        Then vejo que a lista nao possui registros

    Scenario: Buscando condomino inexistente pelo cpf
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o cpf '12345678901'
        And eu clico no botao de buscar
        Then vejo que a lista nao possui registros

    Scenario: Buscando condomino pelo contato
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o contato '190'
        And eu clico no botao de buscar
        Then vejo que a lista nao possui registros

    Scenario: Buscando condomino existente pelo nome
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o nome 'lucas'
        And eu clico no botao de buscar
        Then eu visualizo o registro esperado

    Scenario: Buscando condomino existente pelo cpf
        Given estou na pagina de visualizar condominos
        When preencho campo que possui placeholder 'Buscar por CPF ou nome' com o cpf '12345678901'
        And eu clico no botao de buscar
        Then eu visualizo o registro esperado