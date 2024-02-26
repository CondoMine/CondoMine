#Elementos do Background.
Given('estou na tela inicial adiciono, email {string} e password {string} faco login') do |email, password|
  visit new_user_registration_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_button "Sign up"
end

Given('estou na pagina de gerenciamento de reserva') do
  visit "/reservas"
end

Given('existe um Condomino com o nome {string}, cpf {string}, contato {string} no sistema') do |nome, cpf, contato|
  Condomino.find_or_create_by!(nome: nome, cpf: cpf.gsub(/^0-9/, ''), contato: contato)
end

Given('existe um Ambiente com nome {string}, tipo {string} no sistema de reservas') do |nome, tipo|
  Ambiente.find_or_create_by!(nome: nome, tipo: tipo)
end

#Rotas dos Cenarios
Given('estou na pagina de cadastro de reserva') do
  visit '/reservas/new'
end

Given("estou na pagina de editar uma reserva") do
  # Crie uma reserva aqui. Certifique-se de que a reserva é salva corretamente e tem um id.
  reserva = Reserva.create!(condomino: Condomino.first, ambiente: Ambiente.first, data_ini: "2024-01-01", data_fim: "2024-01-03", hora_ini: "08:00", hora_fim: "14:00")

  # Use o id da reserva ao visitar a rota de edição.
  visit edit_reserva_path(reserva.id)
end

Given('estou na pagina de visualizar as reservas') do
  reserva = Reserva.create!(condomino: 'Marcos Teste', ambiente: 'Quadra', data_ini: '2024-03-10', data_fim: '2024-04-15', hora_ini: '09:00', hora_fim: '13:00')

  visit reserva_path(reserva)
end

#Ações de clicar botões

When('eu clico no botao {string} para a reserva do condomino {string}') do |botao, condomino|
  reserva = Reserva.find_by(condomino: condomino)
  visit reserva_path(reserva)
  click_button botao
end

When('eu clico no botao {string}') do |botao|
  click_button botao
end


When("eu clico no botao para apagar {string}") do |button_id|
  click_on(button_id)
end

When('eu clico no botao {string} para a reserva do condomino {string}') do |botao, condomino|
  reserva = Reserva.find_by(condomino: condomino)
  visit reserva_path(reserva)
  click_button botao
end

#Preenchimento dos dados

When('preencho a data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |data_ini, data_fim, hora_ini, hora_fim|
  fill_in 'reserva_data_ini', with: data_ini
  fill_in 'reserva_data_fim', with: data_fim
  fill_in 'reserva_hora_ini', with: hora_ini
  fill_in 'reserva_hora_fim', with: hora_fim
end

When('eu modofico a data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |data_ini, data_fim, hora_ini, hora_fim|
  fill_in 'reserva_data_ini', with: data_ini
  fill_in 'reserva_data_fim', with: data_fim
  fill_in 'reserva_hora_ini', with: hora_ini
  fill_in 'reserva_hora_fim', with: hora_fim
end


When('seleciono o condomino {string} da lista de condominos') do |condomino_id|
  select(condomino_id, from: 'reserva_condomino_id')
end

When('seleciono o ambiente {string} da lista de ambientes') do |ambiente_id|
  select ambiente_id, from: 'reserva_ambiente_id'
end

When('nao seleciono ambiente da lista de ambientes') do
  #Não precisa do código.
end

When('nao seleciono condomino da lista de condominos') do
  #Não precisa do código
end

#Mensagens

Then('eu vejo a mensagem de sucesso {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('eu vejo a mensagem de erro {string}') do |mensagem|
  expect(page).to have_content(mensagem)
end

Then('existe uma reserva do condomino {string}, ambiente {string}, data inicial {string}, data final {string}, hora inicial {string} e hora final {string}') do |condomino, ambiente, data_ini, data_fim, hora_ini, hora_fim|
  condomino = Condomino.find_by(nome: condomino)
  ambiente = Ambiente.find_by(nome: ambiente)

  Reserva.create!(
    condomino: condomino,
    ambiente: ambiente,
    data_ini: data_ini,
    data_fim: data_fim,
    hora_ini: hora_ini,
    hora_fim: hora_fim
  )
end
