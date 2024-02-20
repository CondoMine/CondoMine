  
  Given('estou na pagina de visualizar condominos') do
    visit condominos_path
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

  Then("eu visualizo o registro esperado ") do
    expect(page).to have_css('.registro', count: 1)
    expect(page).to have_content('lucas')
  end








  