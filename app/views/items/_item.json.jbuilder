json.extract! item, :id, :nome, :estado, :tipo, :data_entrada, :ambiente_id, :created_at, :updated_at
json.url item_url(item, format: :json)
