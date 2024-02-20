  
  Given('estou na pagina de visualizar condominos') do
    visit condominos_path
  end


  Given("existem os condôminos {string} com cpf: {string} e contato: {string} e {string} com cpf: {string} e contato: {string} no sistema") do |nome1, cpf1, contato1, nome2, cpf2, contato2|
    Condomino.find_or_create_by!(nome: nome1, cpf: cpf1.gsub(/^0-9/, ''), contato: contato1)
    Condomino.find_or_create_by!(nome: nome2, cpf: cpf2.gsub(/^0-9/, ''), contato: contato2)
  end

  When("preencho campo que possui placeholder {string} com o nome {string}") do |placeholderText ,name|
    field = find_field(nil, placeholder: placeholderText)['id']
    fill_in(field, with: name)
  end

  When("preencho campo que possui placeholder {string} com o cpf {string}") do |placeholderText ,cpf|
    field = find_field(nil, placeholder: placeholderText)['id']
    fill_in(field, with: cpf)
  end

  When("preencho campo que possui placeholder {string} com o contato {string}") do |placeholderText ,contato|
    field = find_field(nil, placeholder: placeholderText)['id']
    fill_in(field, with: contato)
  end


  When("eu clico no botao de buscar") do
    click_button "Buscar"
  end


  Then("vejo que a lista nao possui registros") do 
    expect(page).to have_css('.registro', count: 0)
  end

  Then("eu visualizo o registro esperado do Condomino {string}") do |nome|
    expect(page).to have_css('.registro', minimum: 1)
    expect(page).to have_content(nome)
  end

  Then("O sistema exibe uma lista com todos os condôminos que contêm {string} no nome") do |nome_parcial|

    registros_encontrados = page.all('.registro', text: nome_parcial)

    expect(registros_encontrados.size).to be > 0
  end

  And("A lista contém mais de um condômino") do
    expect(page).to have_css('.registro', minimum: 2)
  end

