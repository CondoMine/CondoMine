json.extract! funcionario, :id, :nome, :cpf, :funcao, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
