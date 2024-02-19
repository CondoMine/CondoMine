Given('estou na pagina de cadastrar ambiente') do
  visit '/ambientes/new'
  expect(page).to have_current_path('/ambientes/new')
end

Given('estou na pagina de visualizar ambiente') do
  ambiente = Ambiente.create(nome: 'piscina', tipo: 'area comum')

  visit ambiente_path(ambiente)
  expect(page).to have_current_path(ambiente_path(ambiente))
end

Given('estou na pagina de editar ambiente') do
  ambiente = Ambiente.create(nome: 'piscina', tipo: 'area comum')

  visit edit_ambiente_path(ambiente)
  expect(page).to have_current_path(edit_ambiente_path(ambiente))
end


# botoes
When("eu clico no botao create ambiente") do
  click_button "Create Ambiente"
end

When("eu clico no botao show ambiente") do
  click_button "Show this ambiente"
end

When("eu clico no botao update ambiente") do
  click_button "Update Ambiente"
end

When("eu clico no botao destroy this ambiente") do
  click_button "Destroy this ambiente"
end


# preenchimento de dados

When("eu preencho nome {string}, tipo {string}")  do |nome, tipo|
  fill_in 'ambiente[nome]', :with => nome
  fill_in 'ambiente[tipo]', :with => tipo
end


#mensagens

Then("vejo a mensagem {string}, {string} e {string} o nome nao deve ser vazio, nao dever conter numeros e deve possuir pelo menos tres caracteres") do |mensagem, mensagem2, mensagem3|
  expect(page).to have_content(mensagem)
  expect(page).to have_content(mensagem2)
  expect(page).to have_content(mensagem3)
end

Then("vejo a mensagem {string}, {string} e {string} o campo tipo nao deve ser vazio, nao deve conter numeros e deve possuir pelo menos cinco caracteres") do |mensagem, mensagem2, mensagem3|
  expect(page).to have_content(mensagem)
  expect(page).to have_content(mensagem2)
  expect(page).to have_content(mensagem3)
end

Then("vejo a mensagem {string}, {string} e {string} o campo tipo nao deve ser salvo com o nome vazio") do |mensagem, mensagem2, mensagem3|
  expect(page).to have_content(mensagem)
  expect(page).to have_content(mensagem2)
  expect(page).to have_content(mensagem3)
end

Then("a mensagem {string} deve aparecer") do |mensagem|
  expect(page).to have_content(mensagem)
end

Then("a mensagem {string} deve aparecer indicando que o ambiente foi atualizada com sucesso") do |mensagem|
  expect(page).to have_content(mensagem)
end