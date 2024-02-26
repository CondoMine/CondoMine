Given('estou na pagina de cadastrar funcionario') do
  visit '/funcionarios/new'
  expect(page).to have_current_path('/funcionarios/new')
end


When('eu preencho nome {string}, cpf {string}, funcao {string}') do |nome, cpf, funcao|
  fill_in 'funcionario[nome]', :with => nome
  fill_in 'funcionario[cpf]', :with => cpf
  fill_in 'funcionario[funcao]', :with => funcao
end

When('eu clico no botao create funcionario') do
  click_button "Create Funcionario"
end

Then('vejo a mensagem {string} confirmando que o funcionario foi cadastrado corretamente') do |mensagem|
  expect(page).to have_content(mensagem)
end

Given('estou na pagina de editar cadastro de funcionario') do
  funcionario = Funcionario.create(nome: 'eduardo', cpf: '12345678910', funcao: 'gerente')

  visit edit_funcionario_path(funcionario)
  expect(page).to have_current_path(edit_funcionario_path(funcionario))

end

When('eu preencho nome {string}, cpf {string}, funcionario {string}') do |nome, cpf, funcao|
  fill_in 'funcionario[nome]', :with => nome
  fill_in 'funcionario[cpf]', :with => cpf
  fill_in 'funcionario[funcao]', :with => funcao
end

When('eu clico no botao update Funcionario') do
  click_button "Update Funcionario"
end

Given('estou na pagina de visualizar funcionario') do
  funcionario = Funcionario.create(nome: 'eduardo', cpf: '12345678910', funcao: 'gerente')

  visit funcionario_path(funcionario)
  expect(page).to have_current_path(funcionario_path(funcionario))
end

Then('o funcionario com nome {string} não deve estar mais listado') do |nome|
  expect(page).to_not have_content(nome)
end
