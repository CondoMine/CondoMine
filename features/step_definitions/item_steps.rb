Given('estou na pagina de cadastrar item') do
  visit '/items/new'
  expect(page).to have_current_path('/items/new')
end

Given('estou na pagina de visualizar item') do
  @ambiente = Ambiente.create(nome: 'piscina', tipo: 'area comum')
  @item = Item.create(nome: 'cadeira', estado: 'seminovo', tipo: 'movel', data_entrada: '2024-01-01', ambiente_id: @ambiente.id)

  visit items_path(@item)
  expect(page).to have_current_path(items_path(@item))
end

Given('estou na pagina de editar item') do
  # criando um ambiente e um item referente a esse ambiente
  @ambiente_quadra = Ambiente.create(nome: 'piscina', tipo: 'area comum')
  @item_quadra = Item.create(nome: 'cadeira', estado: 'seminovo', tipo: 'movel', data_entrada: '2024-01-01', ambiente_id: @ambiente_quadra.id)

  visit edit_item_path(@item_quadra.id)
end

# Botoes

When("eu clico no botao Create Item") do
  click_button "Create Item"
end

When("eu clico no botao Update Item") do
  click_button "Update Item"
end

When("eu clico no botao Destroy this item") do
  click_button "Destroy this item"
end

# Preenchimento de dados

When("eu preencho nome {string}, estado {string}, tipo {string}")  do |nome, estado, tipo|
  fill_in 'item[nome]', :with => nome
  fill_in 'item[estado]', :with => estado
  fill_in 'item[tipo]', :with => tipo
end

When("eu preencho a data entrada {string}") do |data_entrada|
  fill_in 'item_data_entrada', with: data_entrada
end

When('existe um Ambiente com nome {string}, tipo {string} no sistema') do |nome, tipo|
  Ambiente.find_or_create_by!(nome: nome, tipo: tipo)
end

When('seleciono o ambiente {string}') do |ambiente_id|
  select(ambiente_id, from: 'item_ambiente_id')
end

When("eu mudo o nome do item para {string}")  do |nome|
  fill_in 'item[nome]', :with => nome
end

When("eu mudo o tipo do item para {string}")  do |nome|
  fill_in 'item[tipo]', :with => nome
end

# Mensagem

Then('eu vejo a mensagem {string} de que o item foi criado com sucesso') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('vejo a mensagem {string} e {string} de que se deve ter um ambiente selecionado e que a data de entrada deve ser fornecida') do |mensagem, mensagem2|
  expect(page).to have_content(mensagem)
  expect(page).to have_content(mensagem2)
end

Then('eu vejo a mensagem {string} de que o item foi atualizado com sucesso') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu vejo a mensagem {string} de que o item foi excluido com sucesso') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('vejo a mensagem {string}, {string} e {string} que o campo nao deve ser vazio, nao pode apresentar numeros e que deve conter pelo menos 3 caracteres') do |mensagem, mensagem2, mensagem3|
  expect(page).to have_content(mensagem)
  expect(page).to have_content(mensagem2)
  expect(page).to have_content(mensagem3)
end

# Detalhes do item

Then('eu vejo os detalhes do item') do
  expect(page).to have_content('Nome: cadeira')
  expect(page).to have_content('Tipo: movel')
  expect(page).to have_content('Estado: seminovo')
  expect(page).to have_content('Data entrada: 2024-01-01')
  expect(page).to have_content("Ambiente: #{@item.ambiente.nome}")
end
